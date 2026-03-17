import 'package:bitenow/cancelsuccess.dart';
import 'package:flutter/material.dart';

class Cancellorder extends StatefulWidget {
  const Cancellorder({super.key});

  @override
  State<Cancellorder> createState() => _CancellorderState();
}

class _CancellorderState extends State<Cancellorder> {
  String? selectedReason;

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
              "Cancel Order",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please let us know why you’re cancelling this order. Your feedback helps us improve our service.",
                  ),

                  const SizedBox(height: 10),

                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 251, 184, 206),
                  ),

                  

                  /// ✅ RADIO LIST
                  Expanded(
                    child: ListView(
                      children: reasons.map((reason) {
                        return Column(
                          children: [
                            RadioListTile<String>(
                              title: Text(reason),
                              value: reason,
                              // ignore: deprecated_member_use
                              groupValue: selectedReason,
                              activeColor: Colors.pink,
                              controlAffinity: ListTileControlAffinity.trailing,
                              // ignore: deprecated_member_use
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

                  if (selectedReason == "Other")
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: const TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "Enter your reason",
        border: InputBorder.none, // removes default underline
      ),
    ),
  ),

const SizedBox(height: 15),

/// ✅ BUTTON
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrange,
    minimumSize: const Size(double.infinity, 50),
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
  child: const Text("Submit"),
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