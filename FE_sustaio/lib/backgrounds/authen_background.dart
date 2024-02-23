import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class AuthenBackground extends StatefulWidget {
  final Widget additionalWidget;

  AuthenBackground({
    required this.additionalWidget,
  });

  @override
  State<AuthenBackground> createState() => _AuthenBackgroundState();
}

class _AuthenBackgroundState extends State<AuthenBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildIcon(),
        _buildBottom(widget.additionalWidget),
      ],
    );
  }

  Widget _buildBottom(Widget additionalWidget) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 0.73 * MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  _buildLogo(),
                  additionalWidget,
                ],
              ), // Add any widget here
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Palm.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo() {
    const String text = "Sustaio";

    return Container(
      child: Positioned.fill(
        child: RichText(
          text: TextSpan(
            children: [
              for (int i = 0; i < text.length; i++)
                TextSpan(
                  text: text[i],
                  style: TextStyle(
                    color: i % 2 == 0
                        ? AppStyles.primaryColor1
                        : AppStyles.primaryColor2,
                    fontFamily: 'Wendy One',
                    fontSize: 62.45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
