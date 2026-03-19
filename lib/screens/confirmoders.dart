import 'package:bitenow/screens/ordersuccess.dart';
import 'package:flutter/material.dart';

class Confirmoders extends StatefulWidget {
  const Confirmoders({super.key});

  @override
  State<Confirmoders> createState() => _ConfirmordersState();
}

class _ConfirmordersState extends State<Confirmoders> {

  /// 🔹 Dummy order list (later replace with API)
  List<Map<String, dynamic>> orders = [
    {
      "name": "Chicken Burger",
      "price": 120,
    },
    {
      "name": "Pizza",
      "price": 250,
    }
  ];

  /// 🔹 Location
  String location = "Kollam, Kerala";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    /// 🔹 Calculate total
    double total = orders.fold(
        0, (sum, item) => sum + item["price"]);

    return Scaffold(
      body: Column(
        children: [

          /// HEADER
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "Confirm Orders",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              /// 🔥 MAIN LOGIC HERE
              child: orders.isEmpty
                  ? _buildEmptyUI()
                  : _buildOrdersUI(total),
            ),
          ),
        ],
      ),
    );
  }

  /// ❌ EMPTY UI
  Widget _buildEmptyUI() {
    return Column(
      children: const [
        SizedBox(height: 90),
        Icon(
          Icons.file_open,
          size: 250,
          color: Color.fromARGB(255, 235, 222, 227),
        ),
        SizedBox(height: 20),
        Text(
          "You don't have any",
          style: TextStyle(
              color: Colors.pink,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "active orders at this time",
          style: TextStyle(
              color: Colors.pink,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// ✅ ORDERS UI
  Widget _buildOrdersUI(double total) {
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    /// 🔹 TITLE
    const Text(
      "Shipping Address",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),

    const SizedBox(height: 10),

    /// 🔹 CONTAINER WITH LOCATION
    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 245, 240),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  

       Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    /// 🔹 LEFT TEXT
    const Text(
      "Order Summary",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),

    /// 🔹 RIGHT CONTAINER (EDIT)
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 230, 220),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.deepOrange),
      ),
      child: const Text(
        "Edit",
        style: TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

  ],
),

        /// 🔹 ORDER LIST
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final item = orders[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
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
            color: Colors.orange,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Amount",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹$total",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        /// 🔹 CANCEL BUTTON
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderSuccess(),
                ),
              );
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Order Placed",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}