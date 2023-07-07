import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/text_style.dart';

class BestSellerTag extends StatelessWidget {
  const BestSellerTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 15, 5),
          transform: Matrix4.rotationZ(-0.010),
          decoration: BoxDecoration(
            color: kSuccess.withOpacity(0.9),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child:Text("Best Seller", style: stlH5.copyWith(color: kLight),)),
    );
  }
}
