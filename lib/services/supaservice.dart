
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

 Future<List<Map<String, dynamic>>> getSnacks() async {
  final response = await supabase
      .from('snacks') // ✅ YOUR TABLE NAME
      .select();

  return List<Map<String, dynamic>>.from(response);
}
 Future<List<Map<String, dynamic>>> getMeals() async {
  final response = await supabase
      .from('meals') // ✅ YOUR TABLE NAME
      .select();

  return List<Map<String, dynamic>>.from(response);
}
Future<List<Map<String, dynamic>>> getVegans() async {
  final response = await supabase
      .from('vegans') // ✅ YOUR TABLE NAME
      .select();

  return List<Map<String, dynamic>>.from(response);
}
Future<List<Map<String, dynamic>>> getDessert() async {
  final response = await supabase
      .from('dessert') // ✅ YOUR TABLE NAME
      .select();

  return List<Map<String, dynamic>>.from(response);
}
Future<List<Map<String, dynamic>>> getDrinks() async {
  final response = await supabase
      .from('drinks') // ✅ YOUR TABLE NAME
      .select();

  return List<Map<String, dynamic>>.from(response);
}

/// ❤️ GET FAVORITES
Future<List<Map<String, dynamic>>> getFavorites() async {
  final data = await supabase
      .from('foods')
      .select()
      .eq('is_favorite', true);

  
  return List<Map<String, dynamic>>.from(data);
}
Future<void> addToFavorites(Map<String, dynamic> food) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('favorites').insert({
      'user_id': user.id,
      'item_id': food['id'], // Ensure your 'foods' table has an 'id'
      'item_name': food['food_name'] ?? food['name'],
    });
  }

  /// ❤️ REMOVE FROM FAVORITES
  Future<void> removeFromFavorites(int itemId) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase
        .from('favorites')
        .delete()
        .eq('user_id', user.id)
        .eq('item_id', itemId);
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
 

  // ✅ KEEP THIS ONLY ONCE
  Future<void> toggleFavorite(int id, bool value) async {
    await supabase
        .from('foods')
        .update({'is_favorite': value})
        .eq('id', id);
  }
  
}
