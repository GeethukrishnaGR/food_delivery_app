import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help ({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
 
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
  child: const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Helps and fAQS",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 5),
      Text(
        "How can we help you ?", 
        style: TextStyle(
          fontSize: 16,
          color: Colors.pink,
        ),
      ),
    ],
  ),
),
         Expanded(
  child: Container(
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
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color:Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("FAQ",
                 style: TextStyle(color:Colors.white),),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 197, 209),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("Contact Us",
                style: TextStyle(color: Colors.deepOrange),),
              ),
            ),
          ],
        ),
                  const SizedBox(height: 10),
                   Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color:Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("General",
                 style: TextStyle(color:Colors.white),),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 197, 209),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("Account",
                style: TextStyle(color: Colors.deepOrange),),
              ),
            ),
            SizedBox(width: 10,),
              Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 197, 209),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("Services",
                style: TextStyle(color: Colors.deepOrange),),
              ),
            ),
            
          ],
        ),
        SizedBox(height: 10,),
          Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 45,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 230, 230),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.black),
            const SizedBox(width: 10),

            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
              ),
            ),

           
            GestureDetector(
              onTap: () {
               
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.filter_list,
                  color: Colors.pink,
                  size: 20,
                ),
              ),
            ),
            
          ],
        ),),
        
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),

                                  /// TEXT
                                 Row(
                                  
                                   children: const [
                                     Expanded(
                                       child: Text(
                                         "Find quick answers to common questions.",
                                         style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                       ),
                                     ),
                                     Icon(Icons.keyboard_arrow_down,
                                     color: Colors.deepOrange,),
                                   ],
                                 ),
 const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),
                             Text(
          "Need assistance? You’re in the right place! Browse through our frequently asked questions to find quick answers about orders, payments, delivery, and more.",
          style: TextStyle(fontSize: 12),
        ),
const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),
                              
                                  /// TEXT
                                 Row(
                                  
                                   children: const [
                                     Expanded(
                                       child: Text(
                                         "Quick help for your common queries.",
                                         style: TextStyle(fontSize: 14,color: Colors.deepOrange),
                                       ),
                                     ),
                                     Icon(Icons.keyboard_arrow_down,
                                     color: Colors.deepOrange,),
                                   ],
                                 ),
 const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),

                                  /// TEXT
                                 Row(
                                  
                                   children: const [
                                     Expanded(
                                       child: Text(
                                         "Browse FAQs for instant answers.",
                                         style: TextStyle(fontSize: 14,color: Colors.deepOrange,),
                                       ),
                                     ),
                                     Icon(Icons.keyboard_arrow_down,
                                     color: Colors.deepOrange,),
                                   ],
                                 ),
 const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),
                              Row(
                                  
                                   children: const [
                                     Expanded(
                                       child: Text(
                                         "Solve your questions in seconds",
                                         style: TextStyle(fontSize: 14,color: Colors.deepOrange,),
                                       ),
                                     ),
                                     Icon(Icons.keyboard_arrow_down,
                                     color: Colors.deepOrange,),
                                   ],
                                 ),
 const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),
                               Row(
                                  
                                   children: const [
                                     Expanded(
                                       child: Text(
                                         "Get instant help and support here.",
                                         style: TextStyle(fontSize: 14,color: Colors.deepOrange,),
                                       ),
                                     ),
                                     Icon(Icons.keyboard_arrow_down,
                                     color: Colors.deepOrange,),
                                   ],
                                 ),
 const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                             const SizedBox(height: 10),

        ])))
      ]
      
      ));}}