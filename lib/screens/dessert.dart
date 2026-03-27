import 'package:bitenow/screens/cartpage.dart';
import 'package:bitenow/screens/drinks.dart';
import 'package:bitenow/screens/meals.dart';
import 'package:bitenow/screens/profilepage.dart';
import 'package:bitenow/screens/snacks.dart';
import 'package:bitenow/screens/vegan.dart';
import 'package:bitenow/widget/categoryitem.dart';
import 'package:flutter/material.dart';

class Dessert extends StatefulWidget {
  const Dessert({super.key});

  @override
  State<Dessert> createState() => _DessertState();
}

class _DessertState extends State<Dessert> {

  String selectedCategory = "Dessert";

  /// MULTI SELECT
  List<String> selectedItems = [];

  /// PRICE CONTROL
  double priceValue = 0.5;

  List<String> items = [
    "Creps", "Macarons", "CupCakes",
    "Ice cream", "Flan", "Cheese Cake",
    "Chocolate", "Cakes", "Brownie"
  ];

  void toggleItem(String item) {
    setState(() {
      selectedItems.contains(item)
          ? selectedItems.remove(item)
          : selectedItems.add(item);
    });
  }

  Widget buildItem(String text) {
    bool isSelected = selectedItems.contains(text);

    return GestureDetector(
      onTap: () => toggleItem(text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : const Color(0xFFF7C7C7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.deepOrange,
          ),
        ),
      ),
    );
  }

  Widget buildRow(int start) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .sublist(start, start + 3)
          .map((e) => buildItem(e))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          /// 🔶 HEADER
          Container(
            height: size.height * 0.16,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Text("Filter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),

                Row(
                  children: [

                    /// CART
                    GestureDetector(
                     onTap: () {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Cart",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, a1, a2) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Fixed size call
          color: Colors.deepOrange, // Background color for your cart
          child: CartPage(), // <--- PASS DATA HERE
        ),
      );
    },
    transitionBuilder: (context, anim, sec, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(anim),
        child: child,
      );
    },
  );
},
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.shopping_cart,
                            size: 18, color: Colors.pinkAccent),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// PROFILE
                    GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: "Profile",
                          pageBuilder: (_, __, ___) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: size.width * 0.7,
                                color: Colors.deepOrange,
                                child: ProfilePage(),
                              ),
                            );
                          },
                        );
                      },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,
                            size: 18, color: Colors.pinkAccent),
                      ),
                    ),

                    const SizedBox(width: 20),
                  ],
                )
              ],
            ),
          ),

          /// 🔻 BODY
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// 🔷 CATEGORY ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Snacks())),
                          child: CategoryItem(Icons.fastfood, "Snacks",
                              isSelected: false),
                        ),

                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Meals())),
                          child: CategoryItem(Icons.restaurant, "Meals",
                              isSelected: false),
                        ),

                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Vegan())),
                          child: CategoryItem(Icons.eco, "Vegan",
                              isSelected: false),
                        ),

                        CategoryItem(Icons.icecream, "Dessert",
                            isSelected: true),

                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Drinks())),
                          child: CategoryItem(Icons.local_drink, "Drinks",
                              isSelected: false),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// ⭐ SORT BY
                    const Text("Sort by",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        const Text("Top Rated",
                            style:
                                TextStyle(fontSize: 16, color: Colors.grey)),

                        const SizedBox(width: 10),

                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 📂 CATEGORIES
                    const Text("Categories",
                        style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 10),

                    buildRow(0),
                    const SizedBox(height: 8),
                    buildRow(3),
                    const SizedBox(height: 8),
                    buildRow(6),

                    const SizedBox(height: 25),

                    /// 💰 PRICE
                    const Text("Price",
                        style: TextStyle(
                            color: Colors.deepOrange, fontSize: 22)),

                    Slider(
                      value: priceValue,
                      onChanged: (value) {
                        setState(() {
                          priceValue = value;
                        });
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("₹1"),
                        Text("₹10"),
                        Text("₹50"),
                        Text("₹100"),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// APPLY BUTTON
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          print("Selected: $selectedItems");
                          print("Price: $priceValue");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}