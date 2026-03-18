import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact ({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int selectedIndex = -1;

  List<String> titles = ["Customer Service", "Website", "Whatsapp", "Facebook","InstaGram"];

  
  List<IconData> icons = [
    Icons.support_agent,
    Icons.language,
    Icons.chat ,
    Icons.facebook,
    Icons.camera_alt,
  ];

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
        "Contact Us",
        style: TextStyle(
          fontSize: 30,
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
                  color: const Color.fromARGB(255, 233, 197, 209),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("FAQ",
                 style: TextStyle(color:Colors.pink),),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text("Contact Us",
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
                  const SizedBox(height: 10),

                 
                  Expanded(
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Row(
                                children: [
                                  
                                  Icon(
                                    icons[index],
                                    size: 40,
                                    color: Colors.pink,
                                  ),

                                  const SizedBox(width: 10),

                                  /// TEXT
                                  Expanded(
                                    child: Text(
                                      titles[index],
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),

                                  
                                  Icon(
                                    selectedIndex == index
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),

                            
                          ],
                        );
                      },
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