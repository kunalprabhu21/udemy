import 'package:flutter/material.dart';
import 'package:udemy/screens/Splash.dart';
import 'package:udemy/theme/theme_helper.dart';

void main() {
  ThemeHelper().changeTheme('primary');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: SplashScreen(),
    );
  }
}

