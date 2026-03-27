import 'package:bitenow/screens/confirmoders.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyOrders extends StatefulWidget {
  final String initialTab; // 🔥 ADD THIS
final VoidCallback onConfirm;
  const MyOrders({super.key, this.initialTab = 'Active', required this.onConfirm});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  late String selectedTab;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab; // 🔥 SET INITIAL TAB
  }

  /// 🔹 FETCH ORDERS
  Future<List<Map<String, dynamic>>> fetchOrders(String status) async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];

    final response = await supabase
        .from('orders')
        .select('*')
        .eq('user_id', user.id)
        .eq('status', status.toLowerCase())
        .order('id', ascending: true);

    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          /// 🔝 HEADER
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "My Orders",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          /// 🔽 BODY
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
                children: [

                  /// 🔹 TABS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        
                        child: buildTabButton("Active")),
                      buildTabButton("Completed"),
                      buildTabButton("Cancelled"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 DATA
                  Expanded(
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchOrders(selectedTab),
                      builder: (context, snapshot) {

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text("No orders found."));
                        }

                        final orders = snapshot.data!;

                       return ListView.builder(
  itemCount: orders.length,
  itemBuilder: (context, index) {
    final order = orders[index]; // ✅ now accessible

    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ConfirmOrder(
                cartItems: [
                  {
                    "name": order['title'],
                    "image": order['image_url'],
                    "price": order['price'],
                    "quantity": order['quantity'],
                  }
                ],
                total: (order['price'] ?? 0) *
                       (order['quantity'] ?? 1),

                onConfirm: () async {
                  print("Confirmed");
                },
              ),
            ),
          );
        },

        leading: order['image_url'] != null
            ? Image.network(
                order['image_url'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.image),

        title: Text(order['title'] ?? ""),
        subtitle: Text("Qty: ${order['quantity']}"),

        trailing: Text(
          "₹${order['price']}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  },
);
                      },
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

  /// 🔹 TAB BUTTON
  Widget buildTabButton(String label) {
    final bool isSelected = selectedTab == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.deepOrange : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}