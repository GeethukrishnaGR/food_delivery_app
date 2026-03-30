
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  /// GET ALL FOODS
  Future<List<Map<String, dynamic>>> getFoods() async {
    final response = await supabase
        .from('foods')
        .select('food_name, food_price, image_url');

    return List<Map<String, dynamic>>.from(response);
  }


  /// GET FOODS BY CATEGORY
 Future<List<Map<String, dynamic>>> getFoodsByCategory(String category) async {
  final data = await supabase
      .from('foods')
      .select()
      .eq('category', category);
      

  return data;
}



  /// ADD TO CART
 Future<void> addToCart(Map item) async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) return;

  await supabase.from('cart').insert({
    'user_id': user.id,
    'name': item['name'],
    'image_url': item["image_url"], // 🔥 IMPORTANT (use image_url)
    'price': item['price'],
    'quantity': 1,
  });

  print("Saved: ${item["image_url"]}");
}

 Future<List<Map<String, dynamic>>> getByTable(String table) async {
  final response = await supabase
      .from(table)
      .select();

  return List<Map<String, dynamic>>.from(response);
}
Future<List> getFavorites() async {
  final user = Supabase.instance.client.auth.currentUser;

  final response = await Supabase.instance.client
      .from('favorites')
      .select()
      .eq('user_id', user!.id);

  return response;
}

   Future<void> addToFavorites(Map food) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('favorites').insert({
      'user_id': user.id,
      'item_id': food['id'],
      'item_name': food['food_name'],
      'image_url': food['image_url'],
      'food_price': food['food_price'],
    });
  }

  /// REMOVE FROM FAVORITES
  Future<void> removeFromFavorites(int itemId) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase
        .from('favorites')
        .delete()
        .eq('user_id', user.id)
        .eq('item_id', itemId);
  }

  /// CHECK FAVORITE
  Future<bool> isFavorite(int itemId) async {
    final user = supabase.auth.currentUser;
    if (user == null) return false;

    final data = await supabase
        .from('favorites')
        .select()
        .eq('user_id', user.id)
        .eq('item_id', itemId);

    return data.isNotEmpty;
  }
Future<bool> loginUser(String email, String password) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email, 
        password: password,
      );
      
      // Return true if we have a user, false otherwise
      return res.user != null;
    } catch (e) {
      print("Login error: $e");
      return false;
    }
  }
 

  
  
}
