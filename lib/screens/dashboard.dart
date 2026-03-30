import 'package:bitenow/recommendation.dart';
import 'package:bitenow/screens/bestseller.dart';
import 'package:bitenow/screens/cartpage.dart';
import 'package:bitenow/screens/favoritepage.dart';
import 'package:bitenow/screens/homepage.dart';
import 'package:bitenow/screens/profilepage.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final List<Widget> pages = [
     Homepage(),
     FavoritePage(),
     CartPage(),
     ProfilePage(),
     Bestseller(),
     Recommendation(),
     
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

     bottomNavigationBar: BottomNavigationBar(
  currentIndex: selectedIndex,
  onTap: (index) {
    setState(() {
      selectedIndex = index;
    });
  },

  backgroundColor: Colors.orange, // 🔥 full orange bar

  selectedItemColor: Colors.deepOrange, // 🔥 active icon
  unselectedItemColor: Colors.white,    // 🔥 inactive icons

  type: BottomNavigationBarType.fixed,

  showSelectedLabels: false,
  showUnselectedLabels: false,

  items: const [

    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorite",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "Cart",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ],
),
    );
  }
}