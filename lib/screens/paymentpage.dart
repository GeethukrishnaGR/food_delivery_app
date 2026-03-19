import 'package:bitenow/screens/deliverypage.dart';
import 'package:bitenow/screens/payment.dart';
import 'package:flutter/material.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  
  @override
  Widget build(BuildContext context) {

    double totalAmount = 370; // 🔹 replace with real data later

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    const Text(
      "Shipping Address",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),

    const SizedBox(height: 10),

    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 245, 240),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child:GestureDetector(
  onTap: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DeliveryPage(),
      ),
    );

    if (result != null) {
      setState(() {
      });
    }
  },
  child: Row(
    children: const [
      Icon(Icons.location_on, color: Colors.orange),
      SizedBox(width: 5),
      Text("Select Location"),
    ],
  ),
)
    ),
  
            const SizedBox(height: 20),

            /// 🔹 ORDER SUMMARY ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Order Summary",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔹 SAMPLE ORDER ITEMS
            const ListTile(
              title: Text("Burger"),
              trailing: Text("₹120"),
            ),
            const ListTile(
              title: Text("Pizza"),
              trailing: Text("₹250"),
            ),
             Text(
              "Total Amount: ₹$totalAmount",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          const SizedBox(height: 10),

          const Divider(thickness: 1),

              const SizedBox(height: 10),
               const Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

          

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Payment(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.credit_card, color: Colors.orange),
                    SizedBox(width: 10),
                    Text("Credit Card"),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 10),

          const Divider(thickness: 1),

          SizedBox(height: 10,),
          Text("Delivery Time",
          style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
                const SizedBox(height: 10),

GestureDetector(
  onTap: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DeliveryPage(),
      ),
    );

    // ignore: avoid_print
    print("Returned: $result"); // debug

    if (result != null) {
      setState(() {
      });
    }
  },
  child: Row(
    children: const [
      Text("Estimated Delivery"),
      SizedBox(width: 50),
      Text("25 min"),
    ],
  ),
),
                const SizedBox(height: 10),

          const Divider(thickness: 1),
          
            const Spacer(),

            /// 🔹 PAY BUTTON
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Pay Now",
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
    );
  }
}