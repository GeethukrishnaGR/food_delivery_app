import 'package:bitenow/screens/fooddetailpage.dart';
import 'package:bitenow/screens/confirmoders.dart';
import 'package:bitenow/screens/myorders.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartpageState();
}

class _CartpageState extends State<CartPage> {

  /// 🔹 TOTAL CALCULATION
  double getTotal() {
    return cartItems.fold(
      0,
      (sum, item) =>
          sum + ((item["price"] ?? 0) * (item["quantity"] ?? 1)),
    );
  }

  /// 🔹 TOTAL ITEM COUNT
  int getItemCount() {
  return cartItems.fold<int>(
    0,
    (sum, item) => sum + ((item["quantity"] ?? 1) as int),
  );
}
Future<void> placeOrder() async {
    final supabase = Supabase.instance.client;

    for (var item in cartItems) {
      await supabase.from('orders').insert({
        'title': item['name'],
        'image_url': item['image'],
        'price': item['price'],
        'quantity': item['quantity'],
        'status': 'active',
        'created_at': DateTime.now().toIso8601String(),
      });
    }

    cartItems.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order Placed Successfully")),
    );
  }
  Future<List<Map<String, dynamic>>> fetchCart() async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) return [];

  final response = await supabase
      .from('cart')
      .select('*')
      .eq('user_id', user.id);

  return List<Map<String, dynamic>>.from(response);
}

  @override
  Widget build(BuildContext context) {
    double total = getTotal();

    return Scaffold(
      backgroundColor: Colors.deepOrange,

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Cart"),
        actions: [
          /// 🛒 CART COUNT BADGE
          Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart, size: 30),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: Text(
                      getItemCount().toString(),
                      style: const TextStyle(
                          fontSize: 10, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),

      body: cartItems.isEmpty
    ? _buildEmptyCart()
    : Column(
        children: [

          /// 🧾 ITEM LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Column(
                  children: [
                    Row(
                      children: [

                        /// IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item["image"],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"]?.toString()??'',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "29/11/24",
                                style: const TextStyle(
                                    color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        /// PRICE
                        Text(
                          "₹${item["price"]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// ➕➖ QUANTITY ROW
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [

                        /// FAVORITE
                        Icon(
                          item["favorite"] == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (item["quantity"] > 1) {
                                    item["quantity"]--;
                                  } else {
                                    cartItems.removeAt(index);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove_circle,
                                color: Colors.white,
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 8),
                              child: Text(
                                item["quantity"].toString(),
                                style: const TextStyle(
                                    color: Colors.white),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  item["quantity"]++;
                                });
                              },
                              child: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Divider(color: Colors.white),
                  ],
                );
              },
            ),
          ),

          /// 💰 BILL SECTION
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [

                billRow("Subtotal", total),
                billRow("Tax and Fees", 5),
                billRow("Delivery", 3),

                const Divider(color: Colors.white),

                billRow("Total", total + 8, isBold: true),

                const SizedBox(height: 20),

                /// 🟡 CHECKOUT BUTTON
                GestureDetector(
                 onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ConfirmOrder(
        cartItems: cartItems,
        total: total,
        onConfirm: () async {
          await placeOrder();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  MyOrders(initialTab: 'Active', onConfirm: () async {  await placeOrder(); },),
            ),
          );
        },
      ),
    ),
  );
},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Checkout",
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
          ),
        ],
      ),
    );
  }

  /// EMPTY CART
  Widget _buildEmptyCart() {
    return const Center(
      child: Text(
        "Your CART is empty",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
Widget billRow(String title, double amount, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight:
                isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          "₹$amount",
          style: TextStyle(
            color: Colors.white,
            fontWeight:
                isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}