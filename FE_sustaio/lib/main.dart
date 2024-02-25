import 'package:flutter/material.dart';
import 'package:gdsc_2024/backgrounds/home_background.dart';
import 'package:gdsc_2024/pages/collabdetails_screen.dart';
import 'package:gdsc_2024/pages/home_screen.dart';
import 'package:gdsc_2024/pages/onboarding_screen.dart';
import 'package:gdsc_2024/utils/app_styles.dart';
import 'package:gdsc_2024/utils/data_collab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OnboardingScreen(),
      ),
    );
  }
}
