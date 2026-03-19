import 'dart:convert';
import 'package:bitenow/model/foodmodel.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;


class ApiService {
  static Future<List<Food>> fetchFoods() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Food.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }
}