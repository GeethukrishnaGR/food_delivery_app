// ignore_for_file: use_build_context_synchronously



import 'package:flutter/material.dart';

class Passwordset extends StatelessWidget {
  const Passwordset({super.key});

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
              "Password Settings",
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

  const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        Text("current Password",
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
  child: const Text(
    "Forget Password?",
    style: TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
    ),
  ),
),
                   
                  const SizedBox(height: 30),
  const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        Text("New Password",
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
                    child: const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        
                        Spacer(),
                        Icon(Icons.remove_red_eye_outlined,
                            color: Colors.grey),
                      ],
                    ),
                  ),

                 const SizedBox(height: 20),

  const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        Text("Confirm Password",
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
                    child: const Row(
                      children: [
                       
                        SizedBox(width: 10),
                        
                        Spacer(),
                        Icon(Icons.remove_red_eye_outlined,
                            color: Colors.grey),
                      ],
                    ),
                  ),

                 SizedBox(height: 100,),
                  Container(
                      height: size.height * 0.06,
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "Change password",
                        style: TextStyle(color: Colors.white),
                      ),
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