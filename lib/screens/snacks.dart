import 'package:bitenow/screens/cartpage.dart';
import 'package:bitenow/screens/dessert.dart';
import 'package:bitenow/screens/drinks.dart';
import 'package:bitenow/screens/homepage.dart';
import 'package:bitenow/screens/meals.dart';
import 'package:bitenow/screens/profilepage.dart';
import 'package:bitenow/screens/vegan.dart';
import 'package:bitenow/services/supaservice.dart';
import 'package:bitenow/widget/categoryitem.dart';
import 'package:flutter/material.dart';

class Snacks extends StatefulWidget {
  const Snacks({super.key});

  @override
  State<Snacks> createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  String selectedCategory = "Snacks";

  List<String> selectedSubCategories = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          /// 🔶 HEADER
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Padding(
                  padding: EdgeInsets.only(left: 140),
                  child: Text(
                    "Filter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
    
    showSidePage(
      context, 
      CartPage(), 
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

                    GestureDetector(
                      onTap: () {
                        showSidePage(context, ProfilePage());
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

          /// 🔶 BODY
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// 🔷 CATEGORY ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildIcon(Icons.fastfood, "Snacks", const Snacks()),
                        buildIcon(Icons.restaurant, "Meals", const Meals()),
                        buildIcon(Icons.eco, "Vegan", const Vegan()),
                        buildIcon(Icons.icecream, "Dessert", const Dessert()),
                        buildIcon(Icons.local_drink, "Drinks", const Drinks()),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔷 SORT
                    const Text("Sort by",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Row(
                      children: const [
                        Text("Top Rated",
                            style:
                                TextStyle(fontSize: 18, color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔷 CATEGORY TITLE
                    const Text("Categories",
                        style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 10),

                    /// 🔷 GRID
                    GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 2.5,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        buildCategoryButton("Bruschetta"),
                        buildCategoryButton("Spring Rolls"),
                        buildCategoryButton("Creps"),
                        buildCategoryButton("Wings"),
                        buildCategoryButton("Skewers"),
                        buildCategoryButton("Salman"),
                        buildCategoryButton("Mexican"),
                        buildCategoryButton("Baked"),
                        buildCategoryButton("Appetizer"),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// 🔥 PRICE SECTION (ADDED)
                    const Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Stack(
                      children: [

                        /// Background line
                        Container(
                          height: 6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        /// Orange progress
                        Container(
                          height: 6,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        /// Circle indicator
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.4 - 10,
                          top: -7,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

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

                    /// 🔷 APPLY BUTTON
                    Center(
                      child: GestureDetector(
                      onTap: () async {
  final data = await SupabaseService().getSnacks();

  print("DATA SENT TO HOME: $data"); // 👈 DEBUG

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Homepage(filteredData: data),
    ),
  );
},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

  /// 🔥 ICON NAVIGATION
  Widget buildIcon(IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: CategoryItem(
        icon,
        title,
        isSelected: selectedCategory == title,
      ),
    );
  }

  /// 🔥 MULTI SELECT
  Widget buildCategoryButton(String title) {
    final isSelected = selectedSubCategories.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSubCategories.remove(title);
          } else {
            selectedSubCategories.add(title);
          }
        });
      },
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.deepOrange
              : const Color.fromARGB(255, 247, 199, 199),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// 🔥 SIDE PANEL
  void showSidePage(BuildContext context, Widget page) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Side",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: double.infinity,
            color: Colors.deepOrange,
            child: page,
          ),
        );
      },
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      },
    );
  }
}