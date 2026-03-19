import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

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

            /// 💳 CARD IMAGE
            Center(
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
  image: AssetImage("assets/black-credit-card/6276.jpg"),
  fit: BoxFit.cover,
),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// CARD NUMBER
            _buildField("Card Number", "Enter card number"),

            const SizedBox(height: 20),

            /// CARD HOLDER NAME
            _buildField("Card Holder Name", "Enter name"),

            const SizedBox(height: 20),

          
            Row(
              children: [
                Expanded(
                  child: _buildField("Expiry Date", "MM/YY"),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildField("CVV", "123"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
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

  Widget _buildField(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 206, 155),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
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