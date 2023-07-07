import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../class/app_constant.dart';
import '../../../../../package/text_style.dart';

class ViewAllText extends StatelessWidget {
  final String title;
  final Widget? widget;
  final Color? color;
  final Function()? viewAll;
  const ViewAllText(
      {super.key, this.widget, required this.title, this.color, this.viewAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.fromLTRB(10, 8, 5, 5),
      color: color,
      child: Row(
        children: [
          Text(title, style: stlTimes
              // navTxStl(20, Colors.blueGrey[900], FontWeight.w800),
              ),
          const Spacer(),
          viewAll != null
              ? TextButton(
                  onPressed: viewAll,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("view all ",
                          style: navTxStl(15, Colors.redAccent.shade700, null)),
                      const FaIcon(FontAwesomeIcons.angleRight, size: 16)
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
