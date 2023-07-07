import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/package/text_style.dart';

class OptionsCard extends StatelessWidget {
  final String? title;
  final double? elevation;
  final List<Widget> listOfWidget;


  const OptionsCard({Key? key, this.title, required this.listOfWidget, this.elevation = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.none,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (title != null) ...[
            Text(title!, style: stlT),
            const SizedBox(height: 20),
          ],
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
    this.icon,
    this.label,
    this.title,
    this.textStyle,
  });

  final IconData? icon;
  final String? label;
  final Widget? title;
  final Widget? widget;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          icon == null
              ? const SizedBox.shrink()
              : Icon(icon, size: 18, color: Colors.blueAccent[200]),
          const SizedBox(width: 10),
          title ??
              Text(
                label ?? "",
                style: textStyle ?? txStl(15, Colors.black, FontWeight.normal),
              ),
          const Spacer(),
          widget ?? const FaIcon(FontAwesomeIcons.angleRight, size: 15),
        ],
      ),
    );
  }
}
