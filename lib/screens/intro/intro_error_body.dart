import 'package:flutter/material.dart';

import '../../class/app_constant.dart';
import '../../package/text_style.dart';

class IntroErrorBody extends StatelessWidget {
  const IntroErrorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/no_internet_connection.jpg',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 16),
              const Text('No Internet Connection'),
              const SizedBox(height: 40),
              Text(appName, style: stlH3(Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
