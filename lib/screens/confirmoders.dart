import 'package:bitenow/screens/cancellorder.dart';
import 'package:bitenow/screens/fooddetailpage.dart' as widget;
import 'package:bitenow/screens/ordersuccess.dart';
import 'package:bitenow/screens/payment.dart';
import 'package:flutter/material.dart';

class ConfirmOrder extends StatefulWidget {
  final List cartItems;
  final double total;
  final Future<void> Function() onConfirm;

  const ConfirmOrder({
    super.key,
    required this.cartItems,
    required this.total,
    required this.onConfirm,
  });

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  double getPrice(dynamic price) {
    if (price is int) return price.toDouble();
    if (price is double) return price;
    return double.tryParse(price.toString()) ?? 0;
  }

  double getSubtotal() {
    return widget.cartItems.fold(
      0.0,
      (sum, item) =>
          sum + (getPrice(item["price"]) * (item["quantity"] ?? 1)),
    );}

  @override
  Widget build(BuildContext context) {
     double subtotal = getSubtotal();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Confirm Order",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 📍 ADDRESS
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 196, 127),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.orange),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "778 Locust View Drive Oakland, CA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// 🧾 ORDER LIST
            const Text("Order Summary",
                style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

             Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                final imageUrl = item["image"]?.toString() ?? "";

                return Column(
                  children: [
                    Row(
                      children: [

                        /// IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageUrl.isNotEmpty
                              ? Image.network(
                                  imageUrl,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return const Icon(Icons.broken_image,
                                        color: Colors.white);
                                  },
                                )
                              : const Icon(Icons.image,
                                  color: Colors.white, size: 50),
                        ),

                        const SizedBox(width: 10),

                        /// NAME + QTY
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"] ?? "",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Qty: ${item["quantity"]}",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// PRICE
                        Text(
                          "₹${getPrice(item["price"]).toStringAsFixed(0)}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),SizedBox(height: 10,),
                    
 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /// ❌ CANCEL ITEM BUTTON
                       GestureDetector(
  onTap: () {
    setState(() {
      widget.cartItems.removeAt(index);
    });

    /// 🔥 NAVIGATE TO CANCEL PAGE
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Cancellorder(),
      ),
    );
  },
  child: Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Text(
      "Cancel order",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  ),
),

                        /// ➕➖ BUTTONS
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (item["quantity"] > 1) {
                                    item["quantity"]--;
                                  } else {
                                    widget.cartItems.removeAt(index);
                                  }
                                });
                              },
                              child: const Icon(Icons.remove_circle,
                                  color: Colors.red),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                item["quantity"].toString(),
                                style:
                                    const TextStyle(color: Colors.black),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  item["quantity"]++;
                                });
                              },
                              child: const Icon(Icons.add_circle,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    const Divider(color: Color.fromARGB(255, 253, 137, 137)),
                  ],
                );
              },
            ),
          ),

          /// 💰 BILL SECTION
          Column(
            children: [
          
              billRow("Subtotal", subtotal),
              billRow("Tax", 5),
              billRow("Delivery", 3),
          
              const Divider(color: Color.fromARGB(255, 248, 111, 111)),
          
              billRow("Total", subtotal + 8, isBold: true),
          
              const SizedBox(height: 20),
          
              /// ✅ CONFIRM BUTTON
              GestureDetector(
              onTap: () async {
  await widget.onConfirm(); // place order

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const Payment(),
    ),
  );
},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "Place Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
                    ],
                  ),
   ])) );
  }

  /// 💰 BILL ROW
Widget billRow(String title, double amount, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          "₹${amount.toStringAsFixed(0)}",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
}