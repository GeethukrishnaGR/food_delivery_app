import 'package:bitenow/provider/orderprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key, required Future<Null> Function() onConfirm, required String initialTab});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<OrderProvider>(context, listen: false)
            .loadOrders("Active")); // 🔥 default load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OrderProvider>(
        builder: (context, provider, child) {

          return Column(
            children: [

              Container(
                height: 120,
                width: double.infinity,
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// 🔽 BODY
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [

                      /// 🔥 TABS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildTab("Active", provider),
                          buildTab("Completed", provider),
                          buildTab("Cancelled", provider),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// 🔥 LIST
                      Expanded(
                        child: provider.currentList.isEmpty
                            ? const Center(child: Text("No data"))
                            : ListView.builder(
                                itemCount: provider.currentList.length,
                                itemBuilder: (context, index) {

                                  final item = provider.currentList[index];

                                  return Card(
                                    child: ListTile(
                                      leading: Image.network(
                                        item["image_url"] ?? "",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Text(
                                          item["name"] ??
                                          item["title"] ??
                                          ""),
                                      subtitle: Text(
                                          "Qty: ${item["quantity"] ?? 1}"),
                                      trailing: Text(
                                        "₹${item["price"] ?? 0}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// 🔥 TAB BUTTON
  Widget buildTab(String label, OrderProvider provider) {
    final isSelected = provider.selectedTab == label;

    return GestureDetector(
      onTap: () {
        provider.loadOrders(label); // 🔥 switch tab
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}