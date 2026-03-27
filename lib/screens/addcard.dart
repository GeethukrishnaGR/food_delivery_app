import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  final cardNumberController = TextEditingController();
  final nameController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
        backgroundColor: Colors.orange,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            /// 💳 LIVE CARD PREVIEW
            Container(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.grey],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "CARD NUMBER",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    cardNumberController.text.isEmpty
                        ? "XXXX XXXX XXXX XXXX"
                        : cardNumberController.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nameController.text.isEmpty
                            ? "CARD HOLDER"
                            : nameController.text,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        expiryController.text.isEmpty
                            ? "MM/YY"
                            : expiryController.text,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// CARD NUMBER
            _buildField("Card Number", "Enter card number",
                controller: cardNumberController),

            const SizedBox(height: 20),

            /// NAME
            _buildField("Card Holder Name", "Enter name",
                controller: nameController),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _buildField("Expiry Date", "MM/YY",
                      controller: expiryController),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildField("CVV", "123",
                      controller: cvvController, isPassword: true),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// SAVE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {

                  /// ✅ SIMPLE VALIDATION
                  if (cardNumberController.text.length < 16 ||
                      cvvController.text.length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter valid card details"),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Card Saved Successfully"),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Save Card"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 INPUT FIELD
  Widget _buildField(String title, String hint,
      {required TextEditingController controller, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 206, 155),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,

            /// 🔥 REAL-TIME UPDATE
            onChanged: (value) {
              setState(() {});
            },

            obscureText: isPassword,

            keyboardType: title == "Card Number"
                ? TextInputType.number
                : TextInputType.text,

            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}