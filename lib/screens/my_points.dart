import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';

class MyPoints extends StatelessWidget {
  const MyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(title: "My Points",),
      body: SingleChildScrollView(
        child: Column(
          children: [Text('My Points')],
        ),
      ),
    );
  }
}
