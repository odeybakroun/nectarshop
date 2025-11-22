import 'package:flutter/material.dart';
import 'package:nectarshop/boarding.dart';
import 'package:nectarshop/context/colors.dart';
import 'package:nectarshop/src/core/routes/routes.dart';
 
class FirstBoarding extends StatefulWidget {
  const FirstBoarding({super.key});

  @override
  State<FirstBoarding> createState() => _FirstBoardingState();
}

class _FirstBoardingState extends State<FirstBoarding> {
  final PageController _pageController = PageController();
  int index = 0;

  final List<Widget> myWidgets = [
    Boarding(
      URL: 'assets/images/pageone.png',
      title: 'Amazing discount & offers',
      body:
          'An online store allows customers to shop anytime and anywhere, expanding your reach and reducing costs.',
      page: 1,
    ),
    Boarding(
      URL: 'assets/images/pagetwo.png',
      title: 'Fast & Secure Shopping',
      body:
          'Enjoy a smooth shopping experience with secure payments, fast delivery, and trusted customer service.',
      page: 2,
    ),
    Boarding(
      URL: 'assets/images/pagethree.png',
      title: 'Stay Updated & Connected',
      body:
          'Get instant notifications about new arrivals, special sales, and personalized recommendations.',
      page: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: myWidgets.length,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: myWidgets[i],
              ),
            ),
          ),

          const SizedBox(height: 10 ),

          // ✅ الدائرة مع الزر في المنتصف
          Stack(
            alignment: Alignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: 0,
                  end: (index + 1) / myWidgets.length,
                ),
                duration: const Duration(milliseconds: 600),
                builder: (context, value, child) {
                  return SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: value,
                      color: Colorsapp.primary,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey[300],
                    ),
                  );
                },
              ),

              // ✅ الزر داخل الدائرة
              ElevatedButton(
                onPressed: () {
                  if (index < myWidgets.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.IntroLogin,
                    );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('النهاية')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(18),
                  backgroundColor: Colorsapp.primary,
                  elevation: 6,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
