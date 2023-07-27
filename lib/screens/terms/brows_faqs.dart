import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';

class BrowseFAQS extends StatelessWidget {
  const BrowseFAQS({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text("Browse FAQS"),
            )
          ],
        ),
      ),
    );
  }
}
