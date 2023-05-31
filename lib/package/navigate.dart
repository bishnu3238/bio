import 'package:flutter/material.dart';

class Navigate {
  Navigate._();

  static void go(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
  }

  static void goto(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => widget));
  }
}
