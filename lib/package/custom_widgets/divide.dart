import 'package:flutter/material.dart';

class Divide extends StatelessWidget {
  final double? height;
  final double? thick;
  final Color? color;
  final double? left;
  final double? right;

  const Divide({super.key, this.height, this.color, this.thick, this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? Colors.red[100], height:height?? 5.0, thickness:thick?? 5.0,endIndent: left,indent: right,);
  }
}
