import 'package:supabase_flutter/supabase_flutter.dart';

class ApiService {
  final supabase = Supabase.instance.client;

  /// GET FOODS FROM SUPABASE
  Future<List<Map<String, dynamic>>> fetchFoods() async {
    final data = await supabase.from('foods').select();
    return data;
  }

  /// ADD TO CART
  Future<void> addToCart(Map<String, dynamic> food) async {
    await supabase.from('cart').insert({
      'name': food['name'],
      'price': food['price'],
      'image': food['image'],
    });
  }
}