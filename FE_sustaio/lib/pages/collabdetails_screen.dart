import 'package:flutter/material.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class CollabDetailsScreen extends StatelessWidget {
  const CollabDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Chi tiết",
        //     style: AppStyles.Heading4,
        //   ),
        //   centerTitle: true,
        // ),
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Image.asset('assets/images/avtBr.png'),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: h * 0.4,
          child: Container(
            height: 0.6 * h,
            width: w,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: h * 0.3,
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            child: Column(
              children: [
                _buildUserImage(context),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildUserImage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/avatar.png',
            width: 0.15 * MediaQuery.of(context).size.height,
            height: 0.15 * MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
