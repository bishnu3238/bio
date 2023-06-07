import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/app_constant.dart';

class StackIcon extends StatefulWidget {
  const StackIcon({Key? key}) : super(key: key);

  @override
  State<StackIcon> createState() => _StackIconState();
}

class _StackIconState extends State<StackIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, blurRadius: 2),
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {},
          child: const FaIcon(FontAwesomeIcons.heart, color: kPrimeColor),
        ),
      ),
    );
  }
}
