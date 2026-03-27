import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const CategoryItem(this.icon, this.title,
      {super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.deepOrange   // ✅ selected color
                : const Color.fromARGB(255, 252, 163, 193), // normal color
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.deepOrange : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}