import 'package:flutter/material.dart';

class Notificationset extends StatefulWidget {
  const Notificationset({super.key});

  @override
  State<Notificationset> createState() => _NotificationsetState();
}

class _NotificationsetState extends State<Notificationset> {

  List<String> titles = [
    "General Notification",
    "Sound",
    "Sound Call",
    "Vibrate",
    "Special Offer",
    "Payments",
    "Promo and Discounts",
    "Cash Packs"
  ];

  // Store ON/OFF state for each item
  List<bool> isOn = List.generate(8, (index) => false);

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
              "Notification Setting",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              titles[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),

                        SizedBox(height: 15,),
                          Switch(
                            value: isOn[index],
                            activeThumbColor: Colors.deepOrange,
                            onChanged: (value) {
                              setState(() {
                                isOn[index] = value;
                              });
                            },
                          ),
                        ],
                      ),

                     
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}