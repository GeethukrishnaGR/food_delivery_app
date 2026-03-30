import 'package:bitenow/provider/categoryprovider.dart';
import 'package:bitenow/provider/orderprovider.dart';
import 'package:bitenow/screens/myorders.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wshfepgpolbsdykznmwm.supabase.co',
    anonKey: 'sb_publishable_OvQo7nfuLeyqpVO1EaRE0A_GJ9yTUKR',
  );


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        // Add your CategoryProvider here too since the error mentions it!
        ChangeNotifierProvider(create: (_) => CategoryProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: session != null ? const Dashboard() : const Login(),
    );
  }
}