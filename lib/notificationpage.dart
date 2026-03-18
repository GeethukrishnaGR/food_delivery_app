import 'package:flutter/material.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

          SizedBox(height: 50,),
         Row(
  children: [
Icon(Icons.notifications,color: Colors.white,size: 40,),
SizedBox(width: 5,),
    Text(
      "Notifications",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,color: Colors.white
      ),
    ),
    
    

  ],
),
 const SizedBox(height: 30),
 /// DIVIDER
    const Divider(
      thickness: 1,
    ),
 const SizedBox(height: 20),

   
     Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           padding: const EdgeInsets.all(10),
           decoration: BoxDecoration(
      color: const Color.fromARGB(255, 251, 245, 243),
      borderRadius: BorderRadius.circular(10),
           ),
           child: const Icon(
      Icons.restaurant,
      color: Colors.deepOrange,
      size: 20,
           ),
         ),
     
         const SizedBox(width: 20),
     
         Expanded(
           child: const Text(
      "We have added a product you might like",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
           ),
         ),
       ],
     ),
    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 15),

   
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 251, 245, 243),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Icon(
      Icons.favorite,
      color: Colors.deepOrange,
      size: 20,
    ),
        ),
    
        const SizedBox(width: 20),
    
        Expanded(
    child: const Text(
      "One of your favorite is on promotion ",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
        ),
      ],
    ),

    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),
const SizedBox(height: 15),

   
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    
        Expanded(
    child: const Text(
      "Your order hasbeen delivered",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
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
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           padding: const EdgeInsets.all(10),
           decoration: BoxDecoration(
      color: const Color.fromARGB(255, 251, 245, 243),
      borderRadius: BorderRadius.circular(10),
           ),
           child: const Icon(
      Icons.delivery_dining,
      color: Colors.deepOrange,
      size: 20,
           ),
         ),
     
         const SizedBox(width: 20),
     
         Expanded(
           child: const Text(
      "the delivery on his way",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
           ),
         ),
       ],
     ),


    const SizedBox(height: 5),

    /// DIVIDER
    const Divider(
      thickness: 1,
    ),

        ],
      ),
    );
  }
}