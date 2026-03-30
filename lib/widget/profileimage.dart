import 'dart:io';

import 'package:bitenow/themes/appcolors.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final File? imageFile;
  final String imageUrl;
  final VoidCallback onTap;

  const ProfileImageWidget({
    super.key,
    required this.imageFile,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [

        CircleAvatar(
          radius: size.width * 0.12,
          backgroundImage: imageFile != null
              ? FileImage(imageFile!)
              : (imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : const AssetImage("assets/profile.jpg")
                      as ImageProvider),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                size: size.width * 0.04,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}