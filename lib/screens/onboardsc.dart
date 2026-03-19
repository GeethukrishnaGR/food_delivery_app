// ignore_for_file: use_super_parameters

import 'package:bitenow/screens/intro1.dart';
import 'package:bitenow/screens/intro2.dart';
import 'package:bitenow/screens/intro3.dart';
import 'package:bitenow/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardsc extends StatefulWidget {
  const Onboardsc({Key? key}) : super(key: key);

  @override
  State<Onboardsc> createState() => _OnboardscState();
}

class _OnboardscState extends State<Onboardsc> {
  final PageController _controller = PageController();
  bool lastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [

          /// PAGE VIEW
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                lastPage = index == 2;
              });
            },
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),

        
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

              
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.deepOrange,
                  ),
                ),

                const SizedBox(height: 20),

               
                GestureDetector(
                  onTap: () {
                    if (lastPage) {

                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Intro1(),
                        ),
                      );

                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder:(context) =>Login()));
                                    },
                    
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        lastPage ? "Get Started" : "Next",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}