import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:udemy/auth/Login.dart';

import '../theme/theme_helper.dart';


class OnboardingScreen extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
decoration: PageDecoration(
  bodyAlignment: Alignment.center,
  imageAlignment: Alignment.bottomCenter,
),
      titleWidget: Text("Numerous free \ntrial courses",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 22),textAlign: TextAlign.center,),

      bodyWidget: Text("Free courses for you to\nfind your way to learning",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 15,color: Color(0xff858597)),textAlign: TextAlign.center,),
      image: Image.asset("assets/onb1.png"),
      // Customize the image
    ),
    PageViewModel(
      decoration: PageDecoration(
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.bottomCenter,
      ),
      titleWidget: Text("Quick and easy\nlearning",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 22),textAlign: TextAlign.center,),

      bodyWidget: Text("Easy and fast learning at\nany time to help you\nimprove various skills",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 15,color: Color(0xff858597)),textAlign: TextAlign.center,),
      image: Image.asset("assets/onb2.png"), // Customize the image
    ),
    PageViewModel(
      decoration: PageDecoration(
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.bottomCenter,
      ),
      titleWidget: Text("Create your own\nstudy plan",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 22),textAlign: TextAlign.center,),

      bodyWidget: Text("Study according to the\nstudy plan, make study\nmore motivated",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 15,color: Color(0xff858597)),textAlign: TextAlign.center,),
      image: Image.asset("assets/onb3.png"), // Customize the image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntroductionScreen(

        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        onSkip: () {
          // Handle when the user taps on the "Skip" button
          // You can navigate to the main app screen or perform any other action.
        },
        showSkipButton: true,
        skip: const Text("Skip"),
        done:  Icon(
          Icons.done,
          color: Color(0xff0961F5), // Change the arrow color as needed
          size: 50.0,
        ),
        next: Icon(
          Icons.arrow_circle_right,
          color: Color(0xff0961F5), // Change the arrow color as needed
          size: 50.0,
        ),
        dotsDecorator: DotsDecorator(
          activeColor: Colors.blue, // Customize the active dot color
          size: Size(10.0, 10.0), // Customize the dot size
          color: Colors.grey, // Customize the inactive dot color
          activeSize: Size(22.0, 10.0), // Customize the active dot size
        ),

      ),
    );
  }
}
