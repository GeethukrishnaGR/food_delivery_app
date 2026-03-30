import 'package:bitenow/provider/categoryprovider.dart';
import 'package:bitenow/provider/orderprovider.dart';
import 'package:bitenow/screens/myorders.dart';
import 'package:flutter/material.dart';

Widget buildCategory(
    IconData icon, String title, CategoryProvider provider) {

  final isSelected = provider.selectedCategory == title;

  return GestureDetector(
    onTap: () {
      provider.fetchFoods(title);
    },

    child: Column(
      children: [

        /// 🔥 CIRCLE ICON
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.deepOrange : Colors.white, // 🔥 change color
            border: Border.all(color: Colors.orange, width: 2),
          ),

          child: Icon(
            icon,
            size: 28,
            color: isSelected ? Colors.white : Colors.orange,
          ),
        ),

        const SizedBox(height: 8),

        /// 🔥 TEXT
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.orange : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
Widget buildTab(String label, OrderProvider provider) {
  final isSelected = provider.selectedTab == label;

  return GestureDetector(
    onTap: () async {

      /// 🔥 UPDATE DATABASE FIRST
      await provider.updateOrderStatus(label);

      /// 🔥 THEN LOAD DATA
      provider.loadOrders(label);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepOrange : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}