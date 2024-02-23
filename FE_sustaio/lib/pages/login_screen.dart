import 'package:flutter/material.dart';
import 'package:gdsc_2024/backgrounds/login_background.dart';
import 'package:gdsc_2024/components/login_item.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppStyles.primaryColor1,
      body: Stack(
        children: [
          LoginBackground(),
          LoginItem(),
        ],
      ),
    );
  }
}
