import 'package:bitenow/screens/fooddetailpage.dart';
import 'package:flutter/material.dart';
import 'package:bitenow/services/supaservice.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Bestseller extends StatefulWidget {
  const Bestseller({super.key});

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {
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
      'item_name':'food_name',
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
        title: const Text("Best seller"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
         Text("Discover our most polpular Dishes!",style: TextStyle(
          color: Colors.deepOrange,fontSize: 18,
         ),),
             SizedBox(height: 10,),    
          Expanded(
  child: filteredFoods.isEmpty
      ? const Center(child: Text("No items found"))
      : GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: filteredFoods.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final food = filteredFoods[index];
            final int itemId = food['id'] ?? index;
            final String itemName = food['food_name'] ?? "";

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FoodDetailPage(food: food),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// IMAGE
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20)),
                      child: Image.network(
                        food['image_url'] ?? '',
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(
                          height: 120,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    /// NAME
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        itemName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(height: 5),

                    /// PRICE + FAVORITE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${food['food_price'] ?? 0}",
                            style: const TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                if (favoriteIds.contains(itemId)) {
                                  favoriteIds.remove(itemId);
                                } else {
                                  favoriteIds.add(itemId);
                                }
                              });

                              if (favoriteIds.contains(itemId)) {
                                await service.addToFavorites(itemId as Map<String, dynamic>);
                              } else {
                                await service.removeFromFavorites(itemId);
                              }
                            },
                            child: Icon(
                              favoriteIds.contains(itemId)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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