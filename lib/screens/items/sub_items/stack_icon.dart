import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StackIcon extends StatelessWidget {
  const StackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                           Positioned(
      right: 0,
      top: 0,
      child: Card(
        elevation: 5,
        semanticContainer: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
              maxWidth: 25, minHeight: 25),
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.circlePlus,
            color: Colors.redAccent.shade700,
          ),
        ),
      ),
    );

  }
}
