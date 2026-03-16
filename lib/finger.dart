import 'package:bitenow/homepage.dart';
import 'package:flutter/material.dart';

class Finger extends StatefulWidget {
  const Finger({super.key});

  @override
  State<Finger> createState() => _FingerState();
}

class _FingerState extends State<Finger> {

  bool isTouched = false;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "Set your Fingerprint",
              style: TextStyle(
                fontSize: 20,
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
              child: Column(
                children: [

                  const SizedBox(height: 20),

                  const Text(
                    "Fingerprint authentication provides a fast and secure way for users to access the app using their biometric identity.",
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 80),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTouched = true;
                      });
                    },
                    child: TweenAnimationBuilder(
                      tween: ColorTween(
                        begin: const Color.fromARGB(255, 244, 197, 197),
                        end: Colors.deepOrange,
                      ),
                      duration: const Duration(seconds: 2),
                      builder: (context, Color? color, child) {
                        return Icon(
                          Icons.fingerprint,
                          size: 300,
                          color: isTouched ? color : const Color.fromARGB(255, 244, 197, 197),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 80),

                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          height: size.height * 0.06,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 244, 197, 197),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Homepage()),
                      );
                    },
                          child: Container(
                            height: size.height * 0.06,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}