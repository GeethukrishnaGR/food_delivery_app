// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';


class Loginsignup extends StatelessWidget {
  const Loginsignup({super.key});

  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
        body: 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment:.center , 
            children: [
               SizedBox(
                 height: size.height*0.25,
              width: size.width*0.70,
                child: Image.asset("assets/login.bg.png"),
              ),
              
              Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              
               const SizedBox(height: 10,),
              Text("Enter valid username & password to continue"),
              const SizedBox(height: 10,),
              Container(
                height: size.height*0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                 child: Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.grey,
        ),
        const SizedBox(width: 10),
        const Text(
          "User name",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
                ),

              ),
              const SizedBox(height: 10,),
              Container(
               height: size.height*0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                 
                ),
                padding: const EdgeInsets.all(8.0),
                 child: Row(
      children: [
        Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        const SizedBox(width: 10),
        const Text(
          "Password",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 180,),
        Icon(
          Icons.remove_red_eye_outlined,
          color: Colors.grey,
        ),
      ],
    ),
              ),SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 220,),
                   Text("forgot Password?",style: TextStyle(color: Colors.blue),),
                ],
              ),
             
              const SizedBox(height: 40,),
              SizedBox(
               height: size.height*0.06,
                width: double.infinity,
               
                child: Center(child: const Text("Login",style: TextStyle(color: Colors.white),)),
              
              ),
              const SizedBox(height: 50,),
              Text("_____ or continue with _____",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 20,),
               Row(
               
                children: [
                  Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                       Container(
                                        height: size.height*0.8,
              width: size.width*0.30,
                                         decoration: BoxDecoration(
                                           color: const Color.fromARGB(255, 248, 249, 250),
                                           borderRadius: BorderRadius.circular(12),
                                         ),
                                         child:Center(child:  Image.network("https://cdn-icons-png.flaticon.com/512/0/747.png",color: Colors.grey,)),
                                       ),SizedBox(width: 20,),
                                       Container(
                                           height: size.height*0.8,
              width: size.width*0.30,
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(12),
                                           
                                         ),
                                        child:Center( child: Image.network("https://cdn2.hubspot.net/hubfs/53/image8-2.jpg",fit: BoxFit.cover,),),
                                       ),
                                     
                                           ],
                                         ),
                   
                   ],
                  
                   ),
             SizedBox(height: 70,),
              Row(
                 children: [
                   const SizedBox(height: 10,width: 70,),
                   Text("Haven't any account? ",style: TextStyle(color: Colors.grey),),
                   Text("Sign Up",style: TextStyle(color: Colors.blue),),
            
                 ],
               ),
              
            ],
        ),

      ),
    );
    
      
      
  }
}