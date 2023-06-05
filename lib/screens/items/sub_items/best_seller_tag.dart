import 'package:flutter/material.dart';

class BestSellerTag extends StatelessWidget {
  const BestSellerTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 8, 15, 8),
          transform: Matrix4.rotationZ(-0.010),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Text("Best Seller")),
    );
  }
}
