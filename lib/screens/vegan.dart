import 'package:bitenow/screens/cartpage.dart';
import 'package:bitenow/screens/dessert.dart';
import 'package:bitenow/screens/drinks.dart';
import 'package:bitenow/screens/meals.dart';
import 'package:bitenow/screens/profilepage.dart';
import 'package:bitenow/screens/snacks.dart';
import 'package:bitenow/widget/categoryitem.dart';
import 'package:flutter/material.dart';

class Vegan extends StatefulWidget {
  const Vegan({super.key});

  @override
  State<Vegan> createState() => _VeganState();
}

class _VeganState extends State<Vegan> {

  String selectedCategory = "Vegan";

  /// ✅ MULTI SELECT
  List<String> selectedItems = [];

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
                  padding: EdgeInsets.only(left: 100),
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

                    /// 🛒 CART
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

                    /// 👤 PROFILE
                    GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: "Profile",
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (context, a1, a2) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: size.width * 0.7,
                                color: Colors.deepOrange,
                                child: ProfilePage(),
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
                        child: Icon(Icons.person,
                            size: 18, color: Colors.pinkAccent),
                      ),
                    ),

                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),

          /// 🔶 BODY
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// 🔹 CATEGORY ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        buildNav(Icons.fastfood, "Snacks", const Snacks()),
                        buildNav(Icons.restaurant, "Meals", const Meals()),
                        buildNav(Icons.eco, "Vegan", const Vegan()),
                        buildNav(Icons.icecream, "Dessert", const Dessert()),
                        buildNav(Icons.local_drink, "Drinks", const Drinks()),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text("Sort by",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Row(
                      children: const [
                        Text("Top Rated",
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.grey),
                        Icon(Icons.star, color: Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text("Categories",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),

                    const SizedBox(height: 10),

                    /// ✅ GRID
                    GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 2.5,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        buildBox("Bean Burger"),
                        buildBox("Lasagna"),
                        buildBox("Pizza"),
                        buildBox("Curry"),
                        buildBox("Risotto"),
                        buildBox("Broccoli"),
                        buildBox("Hummus"),
                        buildBox("Quinoa"),
                        buildBox("Salad"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 PRICE
                    const Text("Price",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 26)),

                    const SizedBox(height: 15),

                    Stack(
                      children: [
                        Container(
                          height: 6,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 6,
                          width: size.width * 0.3,
                          color: Colors.deepOrange,
                        ),
                        Positioned(
                          left: size.width * 0.3 - 10,
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

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("₹1"),
                        Text("₹10"),
                        Text("₹50"),
                        Text("₹100"),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// APPLY BUTTON
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("Apply",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
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

  /// 🔹 NAV
  Widget buildNav(IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: CategoryItem(
        icon,
        title,
        isSelected: selectedCategory == title,
      ),
    );
  }

  /// 🔹 SELECTABLE BOX
  Widget buildBox(String title) {
    final isSelected = selectedItems.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedItems.remove(title);
          } else {
            selectedItems.add(title);
          }
        });
      },
      child: Container(
        height: 35,
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
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}