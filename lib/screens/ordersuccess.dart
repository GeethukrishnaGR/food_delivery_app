import 'package:bitenow/screens/trackorder.dart';
import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
 
  const OrderSuccess({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// ✅ SUCCESS ICON
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            /// 🎉 TEXT
            const Text(
              "Order Conformed!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your order has been placed\n successfully",
              style: TextStyle(
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30),

         GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TrackOrder(),
      ),
    );
  },
  child: const Text(
    "Track my Orders",
    style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
),

            const SizedBox(height: 40),

                        GestureDetector(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}