import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

class AddressEmpty extends StatelessWidget {
  const AddressEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLight,
      child: Column(
        children: [
          Image.asset(emptyAddress, colorBlendMode: BlendMode.screen),
          Text(
            "Please add address \nfor delivery product",
            style: stl1(15, kDark, FontWeight.w400),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
