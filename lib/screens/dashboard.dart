import 'package:bitenow/screens/bestseller.dart';
import 'package:bitenow/screens/desserts.dart';
import 'package:bitenow/screens/drinkss.dart';
import 'package:bitenow/screens/mealss.dart';
import 'package:bitenow/screens/cartpage.dart';
import 'package:bitenow/screens/deliverypage.dart';
import 'package:bitenow/screens/dessert.dart';
import 'package:bitenow/screens/dlvryadrs.dart';
import 'package:bitenow/screens/drinks.dart';
import 'package:bitenow/screens/favoritepage.dart';
import 'package:bitenow/screens/meals.dart';
import 'package:bitenow/screens/notificationpage.dart';
import 'package:bitenow/screens/notificationset.dart';
import 'package:bitenow/screens/payment.dart';
import 'package:bitenow/screens/paymentpage.dart';
import 'package:bitenow/screens/settings.dart';
import 'package:bitenow/screens/snacks.dart';
import 'package:bitenow/screens/vegan.dart';
import 'package:bitenow/screens/viewall.dart';
import 'package:bitenow/screens/snackss.dart';
import 'package:bitenow/screens/vegans.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profilepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  List<Map<String, dynamic>> cartItems = [];

  List<Widget> get pages => [
  Homepage(), 
  CartPage(), // Pass it to Cart so it can SHOW items
  const FavoritePage(),
  const ProfilePage(),
  DeliveryPage(),
  Dessert(),
  Desserts(),
  Dlvryadrs(),
  Drinks(),
  Drinkss(),
  Meals(),
  Mealss(),
  Notificationpage(),
  Notificationset(),
  Payment(),
  PaymentPage(),
  Settings(),
  Snacks(),
  Snackss(),
  Vegan(),
  Vegans(),
  Bestseller(),
  ViewAll(),
  Bestseller()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
backgroundColor: Colors.deepOrange,
      /// 🔥 CUSTOM BOTTOM BAR (LIKE FIGMA)
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            /// HOME
            buildNavItem(Icons.home, 0),

            /// CART
            buildNavItem(Icons.shopping_bag, 1),

            /// FAVORITE
            buildNavItem(Icons.favorite, 2),

            /// PROFILE
            buildNavItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  /// 🔥 NAV ITEM DESIGN
  Widget buildNavItem(IconData icon, int index) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.deepOrange : Colors.white,
          size: 24,
        ),
      ),
    );
  }
}