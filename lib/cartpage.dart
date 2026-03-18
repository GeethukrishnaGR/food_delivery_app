import 'package:flutter/material.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

          SizedBox(height: 50,),
         Row(
  children: [
Icon(Icons.shopping_cart,color: Colors.white,size: 40,),
SizedBox(width: 5,),
    Text(
      "Cart",
      style: TextStyle(
        fontSize: 26,
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
    SizedBox(height: 15,),
    Text("Your CART iS empty",
    style: TextStyle(color: Colors.white,
    fontSize: 16),),
 Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    SizedBox(height: 230),

    CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.deepOrange,
        size: 40,
      ),
    ),

    SizedBox(height: 20),

    Text(
      "Want to Add\n something?",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ],
)
        ],
      ),
    );
  }
}