import 'package:flutter/material.dart';

import '../size_config.dart';
import '../text_style.dart';
import 'buttons/custom_buttons.dart';

class PriceAndCheckOut extends StatelessWidget {
  final Color color;
  final String amount;
  final String buttonName;
  final VoidCallback? callBack;
  final double? width;
  const PriceAndCheckOut(
    this.amount, {
    required this.color,
    required this.buttonName,
    required this.callBack,
    this.width = 190,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "Total:\n",
            children: [
              TextSpan(
                text: "\u{20B9} $amount",
                style: stlH4,
              ),
            ],
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(width!),
          child: Buttons(text: buttonName, color: color, onTap: callBack),
        ),
      ],
    );
  }
}
