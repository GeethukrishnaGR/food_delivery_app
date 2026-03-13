import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Image.asset(
            "assets/pre-prepared-food-.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),

      
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [

                  const SizedBox(height: 40),

                  Image.asset(
                    "assets/fast-delivery.png",
                    height: 80,
                    color: Colors.deepOrange,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Fast Delivery",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Enjoy fast and reliable food delivery",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const Text(
                    "from nearby restaurants directly to your home.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const Text(
                    "your food arrives fresh and on time.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}