
import 'package:bitenow/screens/dashboard.dart';
import 'package:bitenow/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wshfepgpolbsdykznmwm.supabase.co',
    anonKey: 'sb_publishable_OvQo7nfuLeyqpVO1EaRE0A_GJ9yTUKR',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
   
    final session = Supabase.instance.client.auth.currentSession;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // If session exists, go to Dashboard. If not, go to Login.
      home: session != null ? const Dashboard() : const Login(),
    );
  }
}