import 'package:bitenow/cartpage.dart';
import 'package:bitenow/notificationpage.dart';
import 'package:bitenow/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  

  @override
  State<Homepage> createState() => _HomepageState();
  
}

class _HomepageState extends State<Homepage> {
   PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          /// TOP ORANGE HEADER
          Container(
            height: size.height * 0.25,
            width: double.infinity,
            color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [

                    const SizedBox(width: 20),

                    Container(
                      width: size.width * 0.60,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [

                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 5),

                          const Text(
                            "Search...",
                            style: TextStyle(color: Colors.grey),
                          ),

                          const Spacer(),

                          Container(
                            height: 28,
                            width: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                            child: const Icon(
                              Icons.filter_list,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                       onTap: () {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Cart",
      transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      color: Colors.deepOrange,
      child:Cartpage(),
    ),
  );
},
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.shopping_cart,
                            size: 18, color: Colors.pinkAccent),
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                       onTap: () {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Notification",
      transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      color: Colors.deepOrange,
      child: Notificationpage(),
    ),
  );
},
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.notifications,
                            size: 18, color: Colors.pinkAccent),
                      ),
                    ),

                   

const SizedBox(width: 10),

GestureDetector(
  onTap: () {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Profile",
      transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      color: Colors.deepOrange,
      child: ProfilePage(),
    ),
  );
},
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  },
  child: const CircleAvatar(
    radius: 15,
    backgroundColor: Colors.white,
    child: Icon(
      Icons.person,
      size: 18,
      color: Colors.pinkAccent,
    ),
  ),
),
                  ],
                ),

                Column(
 
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    const SizedBox(height: 10),

    const Text(
      "Good Morning",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    const SizedBox(height: 10),

    const Text(
      "Rise and shine! It's Breakfast time",
      style: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
    ),

  ],
)
              ],
            ),
          ),

          /// MAIN BODY
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [

                    /// CATEGORY ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CategoryItem(Icons.fastfood, "Snacks"),
                        CategoryItem(Icons.restaurant, "Meals"),
                        CategoryItem(Icons.eco, "Vegan"),
                        CategoryItem(Icons.icecream, "Dessert"),
                        CategoryItem(Icons.local_drink, "Drinks"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Divider(
                      color: Color.fromARGB(255, 245, 135, 172),
                      thickness: 1.5,
                    ),

                    const SizedBox(height: 10),

                    /// BEST SELLER TITLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Best Seller",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "View All >",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// FOOD SCROLL
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          FoodCard("assets/chicken-skewers-.jpg", "\$103"),
                          FoodCard(
                              "assets/front-view-fresh-carrot-salad-grated-salad-with-walnuts-garlic-dark-desk-diet-salad-color-nut-health.jpg",
                              "\$120"),
                          FoodCard("assets/roasted-lamb.jpg", "\$154"),
                          FoodCard("assets/pre-prepared-food-.jpg", "\$80"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                  
                    SizedBox(
                      height: 150,
                      child: PageView(
                         controller: controller,
                        children: const [
                          OnboardItem(
                              "assets/newdils.jpg",
                              "Fresh Food",
                              "Delicious meals everyday", 
                               offer: '30% Off',),
                          OnboardItem(
                              "assets/burger.jpg",
                              "Fast Delivery",
                              "Get food at your doorstep", offer: '30% Off',),
                          OnboardItem(
                              "assets/piza.jpg",
                              "Best Quality",
                              "Healthy and tasty food", offer: '30% Off',),
                               
                          OnboardItem(
                              "assets/shawarma.jpg",
                              "Enjoy Meal",
                              "Enjoy with family & friends", offer: '30% Off',),
                              
                        ],
                      ),
                    ),
                     const SizedBox(height: 10),

      /// SMOOTH INDICATOR
      SmoothPageIndicator(
        controller: controller,
        count: 4,
        effect: const WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.orange,
        ),
      ),
const SizedBox(height: 10),

Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Recommend",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [

      const SizedBox(width: 10),

      Stack(
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
            child: Image.asset(
              "assets/chicken-skewers-.jpg",
              height: 170,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),

          
         Positioned(
  top: 8,
  left: 8,
  child: Row(
    children: [

      /// ⭐ RATING
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Icon(Icons.star, color: Colors.orange, size: 14),
            SizedBox(width: 3),
            Text(
              "4.5",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      const SizedBox(width: 6),

      /// ❤️ LIKE BUTTON
      Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.red,
          size: 16,
        ),
      ),

    ],
  ),
),
         
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "\$103.0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),
      const SizedBox(width: 10),

      Stack(
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
            child: Image.asset(
              "assets/burger.jpg",
              height: 170,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),

         Positioned(
  top: 8,
  left: 8,
  child: Row(
    children: [

      /// ⭐ RATING
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Icon(Icons.star, color: Colors.orange, size: 14),
            SizedBox(width: 3),
            Text(
              "4.5",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      const SizedBox(width: 6),

      /// ❤️ LIKE BUTTON
      Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.red,
          size: 16,
        ),
      ),

    ],
  ),
),
         
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "\$83.0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),


    ],
  ),
)
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

/// CATEGORY WIDGET
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 252, 163, 193),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }
}

/// FOOD CARD
class FoodCard extends StatelessWidget {
  final String image;
  final String price;

  const FoodCard(this.image, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
            child: Image.asset(
              image,
              height: 120,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                price,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ONBOARD CARD
class OnboardItem extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
final String offer;
  const OnboardItem(this.image, this.title, this.desc, {super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          /// LEFT SIDE TEXT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
 const SizedBox(height: 8),

                  Text(
                    offer,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                       fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// RIGHT SIDE IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

        ],
      ),
    );
  }
}