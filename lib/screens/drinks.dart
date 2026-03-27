import 'package:bitenow/screens/dessert.dart';
import 'package:bitenow/screens/meals.dart';
import 'package:bitenow/screens/snacks.dart';
import 'package:bitenow/screens/vegan.dart';
import 'package:bitenow/widget/categoryitem.dart';
import 'package:flutter/material.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {

  String selectedCategory = "Drinks";

  /// ✅ MULTI SELECT LIST
  List<String> selectedItems = [];

  /// ✅ CATEGORY LIST
  final List<String> items = [
    "Coffee","Cocktail","Juice",
    "Milkshake","Wine","Pina colada",
    "Mojito","Craft beer","Ice tea"
  ];

  void toggleItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          /// 🔶 HEADER
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "Filter",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
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

                    /// 🔸 CATEGORY ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Snacks()));
                          },
                          child: CategoryItem(Icons.fastfood, "Snacks",
                              isSelected: selectedCategory == "Snacks"),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Meals()));
                          },
                          child: CategoryItem(Icons.restaurant, "Meals",
                              isSelected: selectedCategory == "Meals"),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Vegan()));
                          },
                          child: CategoryItem(Icons.eco, "Vegan",
                              isSelected: selectedCategory == "Vegan"),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Dessert()));
                          },
                          child: CategoryItem(Icons.icecream, "Dessert",
                              isSelected: selectedCategory == "Dessert"),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Drinks()));
                          },
                          child: CategoryItem(Icons.local_drink, "Drinks",
                              isSelected: selectedCategory == "Drinks"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔸 SORT
                    const Text("Sort by",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Row(
                      children: const [
                        Text("Top Rated", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔸 CATEGORY BOXES
                    const Text("Categories",
                        style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 10),

                    /// ✅ GRID (3 PER ROW)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3, // 👈 SMALL HEIGHT
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final isSelected = selectedItems.contains(item);

                        return GestureDetector(
                          onTap: () => toggleItem(item),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.deepOrange
                                  : const Color.fromARGB(255, 247, 199, 199),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// 🔸 PRICE
                    const Text("Price",
                        style: TextStyle(
                            color: Colors.deepOrange, fontSize: 22)),

                    const SizedBox(height: 10),

                    Stack(
                      children: [
                        Container(
                          height: 6,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 6,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.deepOrange,
                        ),
                        Positioned(
                          left:
                              MediaQuery.of(context).size.width * 0.5 - 10,
                          top: -7,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
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

                    /// 🔸 APPLY BUTTON
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("Apply",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}