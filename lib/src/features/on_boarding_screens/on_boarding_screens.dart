import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../authentication/login_screen.dart';
import 'on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3;

  final List<Widget> onboardingPages = [
    OnboardingPage(
      title: 'Welcome to Coffee Shop',
      description: 'Experience premium coffee blends & cozy ambiance.',
      imagePath: 'assets/images/onboarding_page_1.png',
    ),
    OnboardingPage(
      title: 'Discover Unique Brews',
      description: 'Explore our expertly crafted coffee varieties.',
      imagePath: 'assets/images/onboarding_page_2.png',
    ),
    OnboardingPage(
      title: 'Get Started',
      description: 'Indulge in handcrafted, aromatic coffees today!',
      imagePath: 'assets/images/onboarding_page_3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPageIndicator() {
      List<Widget> indicators = [];
      for (int i = 0; i < _numPages; i++) {
        indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
      }
      return indicators;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 700,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    onboardingPages[index],
                    SizedBox(height: 30),

                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: _currentPage == onboardingPages.length - 1
          ? ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
        },
          style: ElevatedButton.styleFrom(
            primary: secondaryColor, // Change the background color of the button
            onPrimary: primaryColor, // Text color
            elevation: 2, // Elevation of the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), // Rounded corners
            ),
        ), child: Container(
            width: 150,
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
              'Get Started',
              style: GoogleFonts.sora(
                fontSize: 18,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      )
          : FloatingActionButton(
        onPressed: () {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        backgroundColor: secondaryColor,
        foregroundColor: whiteColor,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          color: isActive ? secondaryColor : primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
