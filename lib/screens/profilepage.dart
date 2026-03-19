import 'package:bitenow/screens/contact.dart';
import 'package:bitenow/screens/dlvryadrs.dart';
import 'package:bitenow/screens/help.dart';
import 'package:bitenow/screens/myorders.dart';
import 'package:bitenow/screens/myprofile.dart';
import 'package:bitenow/screens/payment.dart';
import 'package:bitenow/screens/settings.dart';
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

   
    GestureDetector(
      onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Dlvryadrs()),
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
          Icons.location_on,
          color: Colors.deepOrange,
          size: 20,
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
    ),


    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
     GestureDetector(
       onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Payment()),
                      );
                    },
       child: Row(
         children: [
           GestureDetector(
         
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
     ),


    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
    GestureDetector(
       onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Contact()),
                      );
                    },
      child: Row(
        children: [
      GestureDetector(
       
        child: Container(
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
    ),


    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
    GestureDetector(
        onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Help()),
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
    ),

    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 10),

   
    GestureDetector(
       onTap: () async {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Settings()),
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
    ),

    const SizedBox(height: 10),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 20),

   
    GestureDetector(
  onTap: () {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            children: [
              
              const SizedBox(height: 10),

              const Text(
                "Are you sure you want to log out?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 249, 202, 218),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",
                      style: TextStyle(color: Colors.deepOrange)),
                  ),

                 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                     
                      Navigator.pop(context);
                    },
                    child: const Text("Yes,Log Out",
                    style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        );
      },
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
)
        ],
      ),
    );
  }
}