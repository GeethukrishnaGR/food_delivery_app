import 'package:bitenow/provider/categoryprovider.dart';

import 'package:bitenow/widget/buildcategory.dart';
import 'package:flutter/material.dart';
import 'package:bitenow/services/supaservice.dart';
import 'package:bitenow/screens/fooddetailpage.dart';

import 'package:provider/provider.dart';

class Snackss extends StatefulWidget {
  const Snackss({super.key});

  @override
  State<Snackss> createState() => _SnackssState();
}

class _SnackssState extends State<Snackss> {
  final SupabaseService service = SupabaseService();
  CategoryProvider get provider => Provider.of<CategoryProvider>(context);
String selectedCategory = ""; 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

        
Container(
  height: size.height * 0.20,
  width: double.infinity,
  color: Colors.orange,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      /// Row for Back Button + optional title
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
           
            GestureDetector(
              onTap: () {
                Navigator.pop(context); 
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Filter",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      /// 🔍 SEARCH BAR
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 5),
              Text("Search...", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    ],
  ),
),
          
 const SizedBox(height: 15),

            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    buildCategory(Icons.fastfood, "Snacks", provider),
    buildCategory(Icons.restaurant, "Meals", provider),
    buildCategory(Icons.eco, "Vegan", provider),
    buildCategory(Icons.icecream, "Dessert", provider),
    buildCategory(Icons.local_drink, "Drinks", provider),

  ],
),
          /// 🔥 WHITE BODY
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)),
              ),

              /// 🔥 SUPABASE DATA
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: service.getByTable("foods"),
                builder: (context, snapshot) {

                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text("No items found"));
                  }

                  final foods = snapshot.data!;

                 return ListView.builder(
  itemCount: foods.length,
  padding: const EdgeInsets.only(top: 10),
  itemBuilder: (context, index) {
    final food = foods[index];

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
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            /// Large Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                food['image_url'] ?? "",
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            /// Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                food['food_name'] ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 5),

            /// Price + Add Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${food['food_price'] ?? 0}",
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}