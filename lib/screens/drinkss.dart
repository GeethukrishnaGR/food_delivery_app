import 'package:bitenow/screens/desserts.dart';
import 'package:bitenow/screens/mealss.dart';
import 'package:bitenow/screens/snackss.dart';
import 'package:bitenow/screens/vegans.dart';
import 'package:flutter/material.dart';
import 'package:bitenow/services/supaservice.dart';
import 'package:bitenow/screens/fooddetailpage.dart';

import 'package:bitenow/widget/categoryitem.dart';

class Drinkss extends StatefulWidget {
  const Drinkss({super.key});

  @override
  State<Drinkss> createState() => _DrinkssState();
}

class _DrinkssState extends State<Drinkss> {
  final SupabaseService service = SupabaseService();
String selectedCategory = ""; 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

         /// 🔥 ORANGE HEADER (LIKE HOMEPAGE)
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
            /// Back Arrow
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Goes back to previous page (Homepage)
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Drinks",
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
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

    /// 🔥 SNACKS
    GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = "Snacks";
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Snackss()),
        );
      },
      child: CategoryItem(
        Icons.fastfood,
        "Snacks",
        isSelected: selectedCategory == "Snacks",
      ),
    ),

    /// 🔥 MEALS
    GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = "Meals";
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Mealss()),
        );
      },
      child: CategoryItem(
        Icons.restaurant,
        "Meals",
        isSelected: selectedCategory == "Meals",
      ),
    ),

    /// 🔥 VEGAN
    GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = "Vegan"; // ⚠️ FIX CAPITAL V
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Vegans()),
        );
      },
      child: CategoryItem(
        Icons.eco,
        "Vegan",
        isSelected: selectedCategory == "Vegan",
      ),
    ),

    /// 🔥 DESSERT
    GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = "Dessert";
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Desserts()),
        );
      },
      child: CategoryItem(
        Icons.icecream,
        "Dessert",
        isSelected: selectedCategory == "Dessert",
      ),
    ),

    /// 🔥 DRINKS
    GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = "Drinks";
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Drinkss()),
        );
      },
      child: CategoryItem(
        Icons.local_drink,
        "Drinks",
        isSelected: selectedCategory == "Drinks",
      ),
    ),
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
                future: service.getDrinks(),
                builder: (context, snapshot) {

                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text("No drinks found"));
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
                food['title'] ?? "",
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