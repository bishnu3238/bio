import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';

class OfferTag extends StatelessWidget {
  final dynamic offer;
  const OfferTag({Key? key, this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: CircleAvatar(
          backgroundImage:
              const AssetImage("assets/offer_images/offer_tag.jpeg"),
          child: Center(child: Text("$offer"))),
    );
  }
}
