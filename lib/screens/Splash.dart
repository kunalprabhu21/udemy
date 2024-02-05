import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Onboarding.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some initialization process
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Customize the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100.0, // Customize the logo size// Customize the logo color
            ),
            SizedBox(height: 20.0),
            SpinKitFadingCube(
              color: Colors.white, // Customize the spinner color
              size: 50.0, // Customize the spinner size
            ),
            SizedBox(height: 20.0),
            Text(
              'Your LMS App',
              style: TextStyle(
                color: Colors.white, // Customize the text color
                fontSize: 20.0, // Customize the text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}

