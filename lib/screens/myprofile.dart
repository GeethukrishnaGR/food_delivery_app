import 'package:flutter/material.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "My Profile",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

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
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [

          const SizedBox(height: 20),
Center(
  child: Stack(
    children: [
      /// PROFILE IMAGE
      ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
          bottom: Radius.circular(25),
        ),
        child: Container(
          height: 95,
          width: 90,
          color: Colors.grey.shade200,
          child: Image.asset(
            "assets/profile.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),

      /// CAMERA ICON (TOP RIGHT)
      Positioned(
       bottom: 5,
        right: 5,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.camera_alt,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
),
          const Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Full Name",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            height: size.height * 0.06,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 226, 195),
              borderRadius: BorderRadius.circular(8),
            ),
            
          ),
  const SizedBox(height: 20),

          const Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Date of Birth",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            height: size.height * 0.06,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 226, 195),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
         

         
          const SizedBox(height: 20),

          const Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            height: size.height * 0.06,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 226, 195),
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 20),

          const Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Mobile Number",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Container(
            height: size.height * 0.06,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 226, 195),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 50,),
 Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color:Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Update Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
        ]))))]));}}