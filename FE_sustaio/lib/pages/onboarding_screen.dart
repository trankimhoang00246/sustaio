// onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_2024/backgrounds/onboarding_background.dart';
import 'package:gdsc_2024/components/onboarding_list_item.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  bool showButton = false; // Initialize with a default value

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final List<String> onboardingItems = [
      'Discover the world with ease - plan\n your adventures, and find the perfect\n accommodations...',
      'All in one place with Subtaio app!',
    ];
    final int itemCount = onboardingItems.length;

    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppStyles.primaryColor1, // Set your desired color here
    ));

    return Scaffold(
      body: Stack(
        children: [
          OnboardingBackground(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
          ),
          OnboardingList(
            items: onboardingItems,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
