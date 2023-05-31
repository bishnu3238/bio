import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/package/text_style.dart';

class OptionsCard extends StatelessWidget {
  final String title;
  final List<Widget> listOfWidget;

  const OptionsCard({Key? key, required this.title, required this.listOfWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.none,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: stlT),
          const SizedBox(height: 20),
          ...listOfWidget,
        ]),
      ),
    );
  }
}

class Rows extends StatelessWidget {
  const Rows({
    super.key,
    this.widget,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blueAccent[200]),
          const SizedBox(width: 10),
          Text(
            label,
            style: txStl(15, Colors.black, FontWeight.normal),
          ),
          const Spacer(),
          widget ?? const FaIcon(FontAwesomeIcons.angleRight, size: 15),
        ],
      ),
    );
  }
}
