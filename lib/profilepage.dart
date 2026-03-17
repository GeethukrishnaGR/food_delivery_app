import 'package:bitenow/dlvryadrs.dart';
import 'package:bitenow/myorders.dart';
import 'package:bitenow/myprofile.dart';
import 'package:bitenow/payment.dart';
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
 const SizedBox(height: 20),

   
     GestureDetector(
       onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Myorders()),
                      );
                    },
       child: Row(
         children: [
           Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 245, 243),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.deepOrange,
          size: 20,
        ),
           ),
       
           const SizedBox(width: 20),
       
           const Text(
        "My Order",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
           ),
         ],
       ),
     ),
    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 15),

   
    GestureDetector(
       onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Myprofile()),
                      );
                    },
      child: Row(
        children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 245, 243),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.person,
          color: Colors.deepOrange,
          size: 20,
        ),
      ),
      
      const SizedBox(width: 10),
      
      const Text(
        "My Profile",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
        ],
      ),
    ),

    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 15),

   
    Row(
  children: [
    GestureDetector(
        onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Dlvryadrs()),
                      );
                    },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 245, 243),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.deepOrange,
          size: 20,
        ),
      ),
    ),

    const SizedBox(width: 10),

    const Text(
      "Delivery Address",
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),


    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
     Row(
  children: [
    GestureDetector(
        onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Payment()),
                      );
                    },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 245, 243),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.payment,
          color: Colors.deepOrange,
          size: 20,
        ),
      ),
    ),

    const SizedBox(width: 10),

    const Text(
      "Payment Methods",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),


    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
    Row(
  children: [
    Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 245, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.phone_callback,
        color: Colors.deepOrange,
        size: 20,
      ),
    ),

    const SizedBox(width: 10),

    const Text(
      "Contact as",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),


    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
    Row(
  children: [
    Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 245, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.help,
        color: Colors.deepOrange,
        size: 20,
      ),
    ),

    const SizedBox(width: 10),

    const Text(
      "Helps & FAQS",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
    Row(
  children: [
    Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 245, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.settings,
        color: Colors.deepOrange,
        size: 20,
      ),
    ),

    const SizedBox(width: 10),

    const Text(
      "Settings",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 20),

   
    Row(
  children: [
    Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 245, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.logout,
        color: Colors.deepOrange,
        size: 20,
      ),
    ),

    const SizedBox(width: 10),

    const Text(
      "Log Out",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

        ],
      ),
    );
  }
}