import 'package:flutter/material.dart';

class CancelSuccess extends StatelessWidget {
  const CancelSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 100,
            ),

            const SizedBox(height: 20),

            /// TEXT
            const Text(
              "Order Cancelled!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your order has been successfully cancelled.",
             
            ),
              const SizedBox(height: 300),

            const Text(
              "If you have any question reach directly to our",
             
            ),
            const SizedBox(height: 5),
 const Text(
              " customer support",
             
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}