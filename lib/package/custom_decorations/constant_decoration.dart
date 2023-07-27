import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';

radiusOnlyTop([Color? color = kPrimeColor, double tl = 25, double tr = 25]) =>
    BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(tl),
        topRight: Radius.circular(tr),
      ),
    );
