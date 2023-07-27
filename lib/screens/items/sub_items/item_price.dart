import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../class/model/product_master/items_model.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({super.key, required this.items, this.size = 14});

  final ItemModel items;
  final double? size;

  @override
  Widget build(BuildContext context) {
    bool hasDiscount = items.discount != 0;
    final discountStyle = stl1(size, null, FontWeight.bold);
    final nonDiscountStyle = stl1(size! + 2, null, FontWeight.bold);
    return AutoSizeText.rich(
      textAlign: TextAlign.end,
      maxLines: 1,
      style: hasDiscount ? discountStyle : nonDiscountStyle,
      TextSpan(
        text: hasDiscount ? "" : "\u{20B9}",
        style: TextStyle(
          decorationStyle: TextDecorationStyle.solid,
          decoration:
              hasDiscount ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: kDark,
          color: !hasDiscount ? Colors.greenAccent[700] : Colors.grey[500],
        ),
        children: [
          TextSpan(text: items.price.toStringAsFixed(0)),
          TextSpan(
              text: !hasDiscount
                  ? ""
                  : " \u{20B9} ${((items.price * (100 - items.discount)) / 100).toStringAsFixed(0)} ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size! + 5,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none)),
          TextSpan(
              text: !hasDiscount
                  ? ""
                  : " ${items.discount.toStringAsFixed(0)}% Off",
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize: size! -1,
                  decoration: TextDecoration.none))
        ],
      ),
    );
  }
}
