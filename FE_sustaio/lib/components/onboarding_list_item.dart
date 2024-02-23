import 'package:flutter/material.dart';
import 'package:gdsc_2024/pages/login_screen.dart';
import 'package:gdsc_2024/utils/app_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

double deviceHeight = 0.0;
double deviceWidth = 0.0;

class OnboardingList extends StatefulWidget {
  final List<String> items;
  final PageController pageController;

  OnboardingList({
    required this.items,
    required this.pageController,
  });

  @override
  _OnboardingListState createState() => _OnboardingListState();
}

class _OnboardingListState extends State<OnboardingList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 0.4 * deviceHeight,
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return OnboardingItem(
                item: widget.items[index],
                currentIndex: index,
                lastIndex: widget.items.length - 1,
              );
            },
          ),
        ),
        DotOboarding(
          pageController: widget.pageController,
          itemCount: widget.items.length,
        ),
      ],
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String item;
  final int currentIndex;
  final int lastIndex;

  OnboardingItem({
    required this.item,
    required this.currentIndex,
    required this.lastIndex,
  });

  bool isLastItem() {
    return currentIndex == lastIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: !isLastItem() ? 0.174 * deviceHeight : 0,
              ),
              child: Text(
                item,
                style: AppStyles.Body1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        if (currentIndex == lastIndex) _buildNavigateButton(context),
      ],
    );
  }
}

class DotOboarding extends StatelessWidget {
  final PageController pageController;
  final int itemCount;

  const DotOboarding({
    required this.pageController,
    required this.itemCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 0.047 * deviceHeight),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: itemCount,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color(0xFF352555),
                    activeDotColor: AppStyles.primaryColor1,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    expansionFactor: 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildNavigateButton(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 0.075 * deviceHeight,
              bottom: 0.087 * deviceHeight,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor1,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'Login / Sign up',
                  style: AppStyles.Body1.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
