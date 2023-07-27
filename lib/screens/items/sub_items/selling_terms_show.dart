import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../class/app_constant.dart';
import '../../../package/size_config.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';

class SellingTermsShow extends StatelessWidget {
  const SellingTermsShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OptionsCard(listOfWidget: [
      Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/replacement.png",
                    width: getProportionateScreenWidth(50),
                  ),
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    "No replacement available",
                    style: stlBtn(kDark),
                    maxLines: 1,
                  ),
                ],
              )),
          Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 10),
            width: 0.5,
            height: 50,
            decoration:
            const BoxDecoration(color: Colors.red),
          ),
          Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/money.png",
                    width: getProportionateScreenWidth(50),
                  ),
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    "No Cash on delivery available",
                    style: stlBtn(kDark),
                    maxLines: 1,
                  ),
                ],
              )),
        ],
      )
    ]);
  }
}
