import 'package:bitenow/screens/onboardsc.dart';
import 'package:flutter/material.dart';



class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 107, 187),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: size.height * 0.27,
                width: size.width * 0.52,
                child: Image.asset("assets/online_delivery.png"),
              ),

              const SizedBox(height: 15),

              const Text(
                "BiteNow",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              

              SizedBox(height: size.height * 0.04),

              const Text(
                "Order your favorite food from nearby restaurants and ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),

              const Text(
                "get it delivered quickly to your doorstep",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),

              

             SizedBox(height: size.height * 0.06),

              GestureDetector(
               onTap: () {
                                     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const Onboardsc(),
  ),
);
                                    },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 156, 178, 241),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
               SizedBox(height: size.height * 0.06),

              GestureDetector(
               onTap: () {
                                     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const Onboardsc(),
  ),
);
                                    },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 156, 178, 241),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    "Singn Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}