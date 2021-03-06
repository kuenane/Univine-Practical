import 'package:flutter/material.dart';
import 'package:onboardingdemo/views/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical Test',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: OnboardingPage(),
    );
  }
}
