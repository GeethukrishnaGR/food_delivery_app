import 'package:bitenow/addcard.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedIndex = -1;

  List<String> titles = ["Card", "Apple Pay", "PayPal", "Google Pay"];

  /// ✅ ICON LIST (matches each title)
  List<IconData> icons = [
    Icons.credit_card,
    Icons.apple,
    Icons.account_balance_wallet,
    Icons.g_mobiledata,
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
            child: const Text(
              "Payment Method",
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
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  /// 🔁 PAYMENT LIST
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
                                  /// ✅ ICON FROM LIST
                                  Icon(
                                    icons[index],
                                    size: 50,
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

                                  /// RADIO ICON
                                  Icon(
                                    selectedIndex == index
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                          ],
                        );
                      },
                    ),
                  ),

                  /// BUTTON
                  GestureDetector(
                     onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>AddCard()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Add New Card",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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