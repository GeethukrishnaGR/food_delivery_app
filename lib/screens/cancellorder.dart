import 'package:flutter/material.dart';
import 'package:bitenow/screens/cancelsuccess.dart';

class Cancellorder extends StatefulWidget {
  const Cancellorder({super.key});

  @override
  State<Cancellorder> createState() => _CancellorderState();
}

class _CancellorderState extends State<Cancellorder> {
  String? selectedReason;
  final TextEditingController otherController = TextEditingController();

  final List<String> reasons = [
    "Changed my mind",
    "Ordered by mistake",
    "Found a better option",
    "Delivery time is too long",
    "Wrong address selected",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          /// 🔶 HEADER
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "Cancel Order",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          /// 🔶 BODY
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.width * 0.05),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Please let us know why you’re cancelling this order. Your feedback helps us improve our service.",
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                    ),
                  ),

                  SizedBox(height: size.height * 0.02),

                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 251, 184, 206),
                  ),

                  /// 🔶 RADIO OPTIONS
                  Expanded(
                    child: ListView(
                      children: reasons.map((reason) {
                        return Column(
                          children: [
                            RadioListTile<String>(
                              title: Text(reason),
                              value: reason,
                              groupValue: selectedReason,
                              activeColor: Colors.pink,
                              controlAffinity:
                                  ListTileControlAffinity.trailing,
                              onChanged: (value) {
                                setState(() {
                                  selectedReason = value;
                                });
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 251, 184, 206),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),

                  /// 🔶 OTHER TEXT FIELD
                  if (selectedReason == "Other")
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      margin: EdgeInsets.only(bottom: size.height * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        controller: otherController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: "Enter your reason",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                  /// 🔶 SUBMIT BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (selectedReason != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancelSuccess(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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