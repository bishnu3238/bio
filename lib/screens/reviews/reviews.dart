import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBar(
          title: 'Reviews',
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [],
        )));
  }
}
