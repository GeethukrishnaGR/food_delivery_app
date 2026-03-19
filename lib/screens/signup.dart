// ignore_for_file: use_build_context_synchronously

import 'package:bitenow/screens/newacc.dart';
import 'package:bitenow/screens/newpassword.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
              "Hello!",
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
              child: Column(
                children: [

                  const SizedBox(height: 20),

                const Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Welcome",
    style: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
),
                  
                  const SizedBox(height: 20),
  const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        Text("Email or Mobile Number",
                        style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                            ),
                      ],
                    ),
                  
                  Container(
                    height: size.height * 0.06,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 250, 226, 195),
                      borderRadius: BorderRadius.circular(8),
                    ),
                   
                  ),
SizedBox(height: 15,),
                 const Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "password",
    style: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
),
                  Container(
                    height: size.height * 0.06,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 248, 217, 176),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    
                    child: const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        
                        Spacer(),
                        Icon(Icons.remove_red_eye_outlined,
                            color: Colors.grey),
                      ],
                    ),
                  ),

                const SizedBox(height: 10),

Align(
  alignment: Alignment.centerRight,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  Newpassword(),
        ),
      );
    },
    child: const Text(
      "Forget Password?",
      style: TextStyle(
        color: Colors.deepOrange,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

                  const SizedBox(height: 40),

                  /// LOGIN BUTTON
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>NewAcc()),
                      );
                    },
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
  "Or signup",
  style: TextStyle(color: Colors.grey),
),

const SizedBox(height: 15),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

   
    const SizedBox(width: 20),

    /// Fingerprint
    Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 211, 211),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
          ),
        ],
      ),
      child: const Icon(
        Icons.fingerprint,
        color: Colors.deepOrange,
        size: 60,
      ),
    ),

  ],
),
const SizedBox(height: 20),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Text(
      "Don't have an account? ",
      style: TextStyle(color: Colors.grey),
    ),
    Text(
      "Sign up",
      style: TextStyle(
        color: Colors.deepOrange,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}