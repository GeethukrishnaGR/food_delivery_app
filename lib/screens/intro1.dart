import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Image.asset(
            "assets/chicken-skewers-.jpg",
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
                    "assets/card.png",
                    height: 80,
                    color: Colors.deepOrange,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Easy payment",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Pay for your food quickly and safely",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const Text(
                    "using our secure payment system.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const Text(
                    "complete your order in just a few seconds.",
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