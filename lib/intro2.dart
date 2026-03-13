import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Image.asset(
            "assets/penne-pasta.jpg",
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
                    "assets/icon-order.png",
                    height: 80,
                    color: Colors.deepOrange,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Order For Food",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "This app helps you order delicious food",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const Text(
                    "from local restaurants with just a few taps.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),

                  const Text(
                    "Enjoy fast delivery right to your home.",
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