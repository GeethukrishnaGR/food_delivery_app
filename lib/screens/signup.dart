import 'package:bitenow/screens/newacc.dart';
import 'package:bitenow/screens/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final supabase = Supabase.instance.client;

  bool isLoading = false;
  bool obscure = true;

  Future<void> login() async {
    setState(() => isLoading = true);

    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Success ✅")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NewAcc()),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          /// 🔶 HEADER
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "Hello!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

        Expanded(
  child: Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
    ),
    child: SingleChildScrollView( // 🔥 ADDED
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          /// EMAIL
          const Text("Email"),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Enter email",
            ),
          ),

          const SizedBox(height: 15),

          /// PASSWORD
          const Text("Password"),
          TextField(
            controller: passwordController,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: "Enter password",
              suffixIcon: IconButton(
                icon: Icon(obscure
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() => obscure = !obscure);
                },
              ),
            ),
          ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Newpassword(),
                  ),
                );
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// LOGIN BUTTON
          GestureDetector(
            onTap: isLoading ? null : login,
            child: Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),

          const SizedBox(height: 20),

          const Center(child: Text("Or signup")),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? "),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30), 
        ],
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}