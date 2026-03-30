import 'package:bitenow/header/bestsellerheader.dart';
import 'package:bitenow/themes/appcolors.dart';

import 'package:bitenow/widget/bestsellercard.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supaservice.dart';
import '../screens/fooddetailpage.dart';



class Bestseller extends StatefulWidget {
  const Bestseller({super.key});

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {

  final SupabaseService service = SupabaseService();

  List<Map<String, dynamic>> allFoods = [];
  List<Map<String, dynamic>> filteredFoods = [];

  Set<int> favoriteIds = {};

  @override
  void initState() {
    super.initState();
    loadFoods();
    loadFavorites();
  }

  /// LOAD FOODS
  void loadFoods() async {
    final data = await service.getFoods();

    setState(() {
      allFoods = data;
      filteredFoods = data;
    });
  }

  /// LOAD FAVORITES
 Future<void> loadFavorites() async {
  final user = Supabase.instance.client.auth.currentUser;

  final res = await Supabase.instance.client
      .from('favorites')
      .select('item_id')
      .eq('user_id', user!.id);

  setState(() {
    favoriteIds = res
        .map<int>((e) => int.parse(e['item_id'].toString()))
        .toSet();
  });
}

Future<void> toggleFavorite(Map<String, dynamic> food) async {
  final user = Supabase.instance.client.auth.currentUser;
  if (user == null) return;

  final int id = food['id'];

  try {
    if (favoriteIds.contains(id)) {
      await Supabase.instance.client
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', id);

      favoriteIds.remove(id);
    } else {
      await Supabase.instance.client.from('favorites').insert({
        'user_id': user.id,
        'item_id': id,
        'item_name': food['food_name'],
        'image_url': food['image_url'],
        'food_price': food['food_price'],
      });

      favoriteIds.add(id);
    }

    setState(() {}); // 🔥 VERY IMPORTANT

  } catch (e) {
    print("ERROR: $e"); // debug
  }
}

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Best Seller"),
        backgroundColor: AppColors.primary,
      ),

      body: Column(
        children: [

          const BestsellerHeader(),

          Expanded(
            child: filteredFoods.isEmpty
                ? const Center(child: Text("No items found"))
                : GridView.builder(
                    padding: EdgeInsets.all(size.width * 0.03),
                    itemCount: filteredFoods.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width * 0.03,
                      mainAxisSpacing: size.height * 0.02,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {

                      final food = filteredFoods[index];

                      return BestsellerCard(
                        food: food,
                        isFavorite:
                            favoriteIds.contains(food['id']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  FoodDetailPage(food: food),
                            ),
                          );
                        },
                        onFavTap: () => toggleFavorite(food),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}