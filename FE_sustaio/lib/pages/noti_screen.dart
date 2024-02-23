import 'package:flutter/material.dart';
import 'package:gdsc_2024/utils/app_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications",
            style: AppStyles.Heading4,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/empty.png'),
              SizedBox(
                height: 25,
              ),
              Text(
                'You don’t have any messages.',
                style: AppStyles.Body1,
              )
            ],
          ),
        ));
  }
}
