// login_background.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class LoginBackground extends StatefulWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  State<LoginBackground> createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildIcon(),
        _buildBottom(),
        _buildLogo(),
      ],
    );
  }

  Widget _buildBottom() {
    return Column(
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
        ),
      ],
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
}

Widget _buildLogo() {
  const String text = "Sustaio";

  return Positioned.fill(
    child: Align(
      alignment: Alignment(0, -0.25),
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
