

import 'package:bitenow/recommendation.dart';
import 'package:bitenow/screens/bestseller.dart';
import 'package:bitenow/screens/desserts.dart';
import 'package:bitenow/screens/drinkss.dart';
import 'package:bitenow/screens/fooddetailpage.dart';
import 'package:bitenow/screens/mealss.dart';
import 'package:bitenow/screens/cartpage.dart';

import 'package:bitenow/screens/notificationpage.dart';
import 'package:bitenow/screens/profilepage.dart';

import 'package:bitenow/services/supaservice.dart';
import 'package:bitenow/screens/viewall.dart';
import 'package:bitenow/screens/snackss.dart';
import 'package:bitenow/screens/vegans.dart';
import 'package:bitenow/widget/categoryitem.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  final List<Map<String, dynamic>>? filteredData;

  const Homepage({super.key, this.filteredData});
  

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   PageController controller = PageController();
  final SupabaseService service = SupabaseService();
Future<List<Map<String, dynamic>>>? foodList;
String selectedCategory = "";
List<Map<String, dynamic>> selectedSnacks = [];


@override
void initState() {
  super.initState();

  if (widget.filteredData != null && widget.filteredData!.isNotEmpty) {
    print("USING FILTERED DATA");
    foodList = Future.value(widget.filteredData);
    
  } else {
    print("USING DEFAULT FOODS");
    foodList = service.getFoods();
  }
}
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
    pageBuilder: (context, a1, a2) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Fixed size call
          color: Colors.deepOrange, // Background color for your cart
          child: CartPage(), // <--- PASS DATA HERE
        ),
      );
    },
    transitionBuilder: (context, anim, sec, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(anim),
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
  children: [

    GestureDetector(
    onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Snackss(), // category page
      ),
    );
  },
      child: CategoryItem(
        Icons.fastfood,
        "Snacks",
        isSelected: selectedCategory == "Snacks",
      ),
    ),

     GestureDetector(
    onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Mealss(), // category page
      ),
    );
  },
      child: CategoryItem(
        Icons.restaurant,
        "Meals",
        isSelected: selectedCategory == "Meals",
      ),
    ),
    GestureDetector(
    onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Vegans(), // category page
      ),
    );
  },
      child: CategoryItem(
        Icons.eco,
        "Vegan",
        isSelected: selectedCategory == "vegan",
      ),
    ),

    GestureDetector(
      onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Desserts()),
  );
},
      child: CategoryItem(
        Icons.icecream,
        "Dessert",
        isSelected: selectedCategory == "Dessert",
      ),
    ),

    GestureDetector(
      onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Drinkss()),
  );
},
      child: CategoryItem(
        Icons.local_drink,
        "Drinks",
        isSelected: selectedCategory == "Drinks",
      ),
    ),

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
                      children: [
                        GestureDetector(
                           onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Bestseller(),
      ),
    );
  },
                          child: const Text(
                            "Best Seller",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ViewAll(),
      ),
    );
  },
  child: const Text(
    "View All >",
    style: TextStyle(
      fontSize: 16,
      color: Colors.deepOrange,
      fontWeight: FontWeight.w500,
    ),
  ),
),
                      ],
                    ),

                    const SizedBox(height: 10),

                /// FOOD SCROLL (FINAL WORKING)
if (foodList != null)
  SizedBox(
    height: 130,
    child: FutureBuilder<List<Map<String, dynamic>>>(
  future: foodList,
  builder: (context, snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Error loading data"));
    }

    final foods = snapshot.data ?? [];

    if (foods.isEmpty) {
      return const Center(child: Text("No items found"));
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index];

        return Container(
          margin: const EdgeInsets.only(right: 15),
          child: Stack(
            children: [

              /// IMAGE CLICK
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodDetailPage(food: food),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    food['image_url'] ?? "",
                    height: 120,
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Image.asset(
                      "assets/burger.jpg",
                      height: 120,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              /// ❤️ FAVORITE
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () async {
                    final newValue = !(food['is_favorite'] ?? false);

                    await service.toggleFavorite(food['id'], newValue);

                    setState(() {
                      food['is_favorite'] = newValue;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      (food['is_favorite'] ?? false)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ),
              ),

              /// PRICE
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "₹${food['food_price'] ?? 0}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  },
)
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

GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Recommendation(),
      ),
    );
  },
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Recommend",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: FutureBuilder<List<Map<String, dynamic>>>(
    future: SupabaseService().getMeals(), // 🔥 your supabase function
    builder: (context, snapshot) {

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        );
      }

      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Text("No food found"),
        );
      }

      final foods = snapshot.data!;

      return Row(
        children: [

          const SizedBox(width: 10),

          ...foods.map((food) {

            /// ✅ FIX PRICE TYPE ERROR
            final price = food['food_price'] is int
                ? food['food_price']
                : int.tryParse(food['food_price'].toString()) ?? 0;

            final imageUrl = food['image_url'] ?? '';

            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(

                
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodDetailPage(food: food),
                    ),
                  );
                },

                child: Stack(
                  children: [

                    /// IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: imageUrl.isNotEmpty
                          ? Image.network(
                              imageUrl,
                              height: 170,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 170,
                              width: 150,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.broken_image),
                            ),
                    ),

                    /// ⭐ RATING + ❤️
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Row(
                        children: [

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

                    /// 💰 PRICE
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
                          "₹$price",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          }).toList(),

        ],
      );
    },
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