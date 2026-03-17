import 'package:bitenow/cancellorder.dart';
import 'package:flutter/material.dart';

class Myorders extends StatelessWidget {
  const Myorders({super.key});

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
              "My Orders",
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

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Active",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 199, 199),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Completed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),

            
            GestureDetector(
                onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Cancellorder()),
                      );
                    },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 195, 195),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Cancelled",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),

          ],
        ),
SizedBox(height: 90,),
Icon(
 Icons.file_open,
  size: 250,
  color: const Color.fromARGB(255, 235, 222, 227),),

  SizedBox(height: 20,),
  Text("You don't have any ",
  style: TextStyle(color: Colors.pink,fontSize: 18,
  fontWeight: FontWeight.bold),),

   SizedBox(height: 5,),
  Text(" active Orders at this time",
  style: TextStyle(color: Colors.pink,fontSize: 18,
   fontWeight: FontWeight.bold),),

   SizedBox(height: 5,),
  Text(" time",
  style: TextStyle(color: Colors.pink,fontSize: 18,
   fontWeight: FontWeight.bold
  ),

  ),
  
      ],
    ),
  ),
)]));}}