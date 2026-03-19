import 'package:bitenow/screens/confirmoders.dart';
import 'package:bitenow/screens/paymentpage.dart';
import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

  /// 🔹 Cart list (dummy for now)
  List<Map<String, dynamic>> cartItems = [
    // Uncomment to test items 👇
    // {"name": "Burger", "price": 120},
    // {"name": "Pizza", "price": 200},
  ];

  @override
  Widget build(BuildContext context) {

    /// 🔹 Total calculation
    double total = cartItems.fold(
        0, (sum, item) => sum + item["price"]);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

          const SizedBox(height: 50),

          /// HEADER
          GestureDetector(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                );
              },
            child: Row(
              children: const [
                Icon(Icons.shopping_cart,
                    color: Colors.white, size: 40),
                SizedBox(width: 5),
                Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          const Divider(thickness: 1),

          const SizedBox(height: 15),

          /// 🔥 CONDITION HERE
          cartItems.isEmpty
              ? _buildEmptyCart()
              : _buildCartItems(total),
        ],
      ),
    );
  }

  /// ❌ EMPTY CART UI
  Widget _buildEmptyCart() {
    return Column(
      children: const [
        Text(
          "Your CART is empty",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 230),

        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.deepOrange,
            size: 40,
          ),
        ),

        SizedBox(height: 20),

        Text(
          "Want to Add\n something?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  /// ✅ CART ITEMS UI
  Widget _buildCartItems(double total) {
    return Expanded(
      child: Column(
        children: [

          /// 🔹 ITEM LIST
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Card(
                  child: ListTile(
                    title: Text(item["name"]),
                    trailing: Text("₹${item["price"]}"),
                  ),
                );
              },
            ),
          ),

          /// 🔹 TOTAL
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹$total",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 CHECKOUT BUTTON
          GestureDetector(
             onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Confirmoders(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Checkout",
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
    );
  }
}