import 'package:bitenow/screens/fooddetailpage.dart';
import 'package:flutter/material.dart';
import 'package:bitenow/services/supaservice.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  final SupabaseService service = SupabaseService();

  List<Map<String, dynamic>> allFoods = [];
  List<Map<String, dynamic>> filteredFoods = [];

  /// ✅ store favorite ids
  Set<int> favoriteIds = {};

  @override
  void initState() {
    super.initState();
    loadFoods();
    loadFavorites(); // 🔥 load already saved favorites
  }

  /// 🔥 LOAD FOODS
  void loadFoods() async {
    final data = await service.getFoods();
    setState(() {
      allFoods = data;
      filteredFoods = data;
    });
  }

  /// 🔥 LOAD FAVORITES FROM DB
  Future<void> loadFavorites() async {
    final user = Supabase.instance.client.auth.currentUser;

    final res = await Supabase.instance.client
        .from('favorites')
        .select()
        .eq('user_id', user!.id);

    setState(() {
      favoriteIds =
          res.map<int>((e) => e['item_id'] as int).toSet();
    });
  }

  /// 🔥 ADD FAVORITE
  Future<void> addToFavorites(int id, String name) async {
    final user = Supabase.instance.client.auth.currentUser;

    await Supabase.instance.client.from('favorites').insert({
      'user_id': user!.id,
      'item_id': id,
      'item_name': name,
      'image_url': '"image_url"'
    });
  }

  /// 🔥 REMOVE FAVORITE
  Future<void> removeFromFavorites(int id) async {
    final user = Supabase.instance.client.auth.currentUser;

    await Supabase.instance.client
        .from('favorites')
        .delete()
        .eq('user_id', user!.id)
        .eq('item_id', id);
  }

  /// 🔍 SEARCH
  void searchFood(String value) {
    final results = allFoods.where((food) {
      final name = food['food_name'].toString().toLowerCase();
      return name.contains(value.toLowerCase());
    }).toList();

    setState(() {
      filteredFoods = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Foods"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          /// 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: searchFood,
              decoration: InputDecoration(
                hintText: "Search food...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          /// 🔥 LIST
          Expanded(
            child: filteredFoods.isEmpty
                ? const Center(child: Text("No items found"))
                : ListView.builder(
                    itemCount: filteredFoods.length,
                    itemBuilder: (context, index) {
                      final food = filteredFoods[index];

                      /// ✅ unique id (IMPORTANT)
                      final int itemId =
                          food['id'] ?? index; // fallback if no id
                      final String itemName =
                          food['food_name'] ?? "";

                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        child: Stack(
                          children: [
                            /// IMAGE
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        FoodDetailPage(food: food),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  food['image_url'] ?? '',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            /// ⭐ + ❤️
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Row(
                                children: [
                                  /// ⭐ RATING
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.orange,
                                            size: 14),
                                        const SizedBox(width: 3),
                                        Text(
                                          "${food['rating'] ?? 4.0}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 6),

                                  /// ❤️ FAVORITE BUTTON
                               GestureDetector(
  onTap: () async {
    final itemId = food['id'];

    setState(() {
      if (favoriteIds.contains(itemId)) {
        favoriteIds.remove(itemId);
      } else {
        favoriteIds.add(itemId);
      }
    });

    // 🔥 Sync with Supabase Database
    if (favoriteIds.contains(itemId)) {
      await SupabaseService().addToFavorites(itemId);
    } else {
      await SupabaseService().removeFromFavorites(itemId);
    }
    
  },
  child: Container(
    padding: const EdgeInsets.all(5),
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Icon(
      favoriteIds.contains(food['id'])
          ? Icons.favorite
          : Icons.favorite_border,
      color: Colors.red,
      size: 16,
    ),
  ),
)
                                ],
                              ),
                            ),

                            /// 💰 PRICE
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "₹${food['food_price']}",
                                  style: const TextStyle(
                                      color: Colors.white),
                                ),
                              ),
                            ),

                            /// 🏷 NAME
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                child: Text(
                                  itemName,
                                  style: const TextStyle(
                                      color: Colors.white),
                                ),
                              ),
                            ),

                            /// 🛒 CART
                            Positioned(
                              bottom: 60,
                              right: 10,
                              child: GestureDetector(
                                onTap: () async {
                                  await service.addToCart(food);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Added to cart")),
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(8),
                                  decoration:
                                      const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}