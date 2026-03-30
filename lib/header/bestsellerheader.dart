
import 'package:bitenow/themes/appcolors.dart';
import 'package:flutter/material.dart';


class BestsellerHeader extends StatelessWidget {
  const BestsellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.02),

        Text(
          "Discover our most popular dishes!",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}