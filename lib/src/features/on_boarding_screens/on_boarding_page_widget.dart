import 'package:coffee_shop/src/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 70),
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end
          ,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.sora(
                color: whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 370,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
