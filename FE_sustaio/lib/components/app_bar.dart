import 'package:flutter/material.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class TitleAppbar extends StatelessWidget {
  final String title;

  const TitleAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyles.primaryColor1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.5,
          vertical: 5,
        ),
        child: Text(
          'Collab',
          style: AppStyles.Heading3.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
