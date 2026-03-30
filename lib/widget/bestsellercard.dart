import 'package:bitenow/themes/appcolors.dart';
import 'package:flutter/material.dart';

class BestsellerCard extends StatelessWidget {
  final Map<String, dynamic> food;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavTap;

  const BestsellerCard({
    super.key,
    required this.food,
    required this.isFavorite,
    required this.onTap,
    required this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /// IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                food['image_url'] ?? '',
                height: size.height * 0.15,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: size.height * 0.15,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.005),

            /// NAME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                food['food_name'] ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.035,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(height: size.height * 0.005),

            /// PRICE + FAVORITE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "₹${food['food_price'] ?? 0}",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.035,
                    ),
                  ),

                  /// ❤️ FAVORITE ICON
                  GestureDetector(
                    onTap: () {
                        print("ICON CLICKED"); 
                      onFavTap(); // call parent function
                    },
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
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