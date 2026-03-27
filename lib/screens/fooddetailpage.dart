import 'package:bitenow/services/supaservice.dart';
import 'package:flutter/material.dart';

/// 🔴 GLOBAL CART & FAVORITES
List<Map<String, dynamic>> cartItems = [];
List<Map<String, dynamic>> favoriteItems = [];

class FoodDetailPage extends StatefulWidget {
  final Map<String, dynamic> food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // 🔹 Safe parsing for price
    final price = widget.food['food_price'] is int
        ? widget.food['food_price']
        : int.tryParse(widget.food['food_price'].toString()) ?? 0;
    final total = price * quantity;

    // 🔹 Safe image URL
    final imageUrl = widget.food['image_url']?.toString() ?? '';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 226, 182),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔴 TOP IMAGE
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: imageUrl.isNotEmpty
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.broken_image, size: 100),
                ),

                /// 🔹 BACK BUTTON
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                /// 🔹 FOOD NAME + FAVORITE
                Positioned(
                  bottom: 60,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// FOOD NAME
                      Expanded(
                        child: Text(
                          widget.food['food_name'] ?? '',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// ❤️ FAVORITE BUTTON
                      GestureDetector(
                        onTap: () async {
                          try {
                            final service = SupabaseService();
                            await service.addToFavorites(widget.food);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Added to Favorites ❤️")),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Already in Favorites or Error")),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// ⭐ RATING
                Positioned(
                  bottom: 30,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 5),
                        Text(
                          "4.5",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 🔴 CONTENT
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + PRICE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.food['food_name'] ?? '',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹$price",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// DESCRIPTION
                  const Text(
                    "Delicious food with best quality and fresh ingredients.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  /// 🔴 QUANTITY SELECTOR
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon:
                            const Icon(Icons.remove_circle, color: Colors.orange),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon:
                            const Icon(Icons.add_circle, color: Colors.orange),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// PRICE DETAILS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Price"),
                      Text("₹$total"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// 🔴 ADD TO CART BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        cartItems.add({
                          'name': widget.food['food_name'],
                          'image': imageUrl,
                          'price': price,
                          'quantity': quantity,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to Cart")),
                        );
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class onConfirm {
}
