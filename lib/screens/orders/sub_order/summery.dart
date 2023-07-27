import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

class Summery extends StatelessWidget {
  const Summery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_alt_rounded,
            size: getProportionateScreenWidth(100),
            color: kSuccess,
          ),
          gap(20),
          Text(
            "Your order will be confirmed ...",
            style: stlight,
          ),
          gap(10),
          Text(
            "Please contact the administrator: $gPayNumber",
            textAlign: TextAlign.center,
            style: stlH4,
          )
        ],
      ),
    ));
  }
}
