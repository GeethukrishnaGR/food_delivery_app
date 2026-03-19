import 'package:bitenow/model/foodmodel.dart';
import 'package:flutter/material.dart';


class FoodCardApi extends StatelessWidget {
  final Food food;

  const FoodCardApi({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
            child: Image.network(
              food.image,
              height: 120,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "₹${food.price}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}