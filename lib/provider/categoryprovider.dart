import 'package:flutter/material.dart';
import 'package:bitenow/services/supaservice.dart';

class CategoryProvider extends ChangeNotifier {
  String selectedCategory = "";
  List<Map<String, dynamic>> foods = [];

  final service = SupabaseService();

 Future<void> fetchFoods(String category) async {
  selectedCategory = category;

  // 🔥 Map button name → table name
  final Map<String, String> tableMap = {
    "Snacks": "snacks",
    "Meals": "meals",
    "Vegan": "vegans",
    "Dessert": "dessert",
    "Drinks": "drinks",
  };

  final tableName = tableMap[category];

  if (tableName != null) {
     foods = await service.getByTable(tableName); // ✅ dynamic call
  } else {
    foods = [];
  }

  notifyListeners();
}

}