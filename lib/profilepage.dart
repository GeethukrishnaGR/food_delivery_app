import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

          const SizedBox(height: 40),

        
         Row(
  children: [

    /// PROFILE IMAGE CONTAINER
    Container(
  padding: const EdgeInsets.all(15),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
  ),
  child: const CircleAvatar(
    radius: 30,
    backgroundImage: AssetImage("assets/profile.jpg"),
  ),
),

    const SizedBox(width: 5),

   
    const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "John Smith",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,color: Colors.white
          ),
        ),

        SizedBox(height: 5),

        Text(
          "john@gmail.com",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),

      ],
    ),

  ],
),
 const SizedBox(height: 35),

    /// MY ORDERS ROW
    const Row(
      children: [

        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),

        SizedBox(width: 10),

        Text(
          "My Orders",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),

    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),

        ],
      ),
    );
  }
}