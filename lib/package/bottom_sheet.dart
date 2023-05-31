import 'package:flutter/material.dart';

customSheet(BuildContext ctx, Widget sheet, [Color? color]) {
  showModalBottomSheet(
    context: ctx,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: color ?? Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(25), right: Radius.circular(25))),
    builder: (ctx) {
      return sheet;
    },
  );
}
