import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PointIcon extends StatelessWidget {
  const PointIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          onPressed: () {
            // open dialog;
            // show user total points and redeem amount;
          },
          icon: const Icon(Icons.money)),
    );
  }
}
