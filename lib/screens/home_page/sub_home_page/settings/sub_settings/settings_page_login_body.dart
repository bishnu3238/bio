import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import '../../../../../class/app_constant.dart';
import '../../../../../package/text_style.dart';
import '../../../../my_points.dart';
import '../../../../reviews.dart';
import 'options_card.dart';

class SettingPageLogInBody extends StatelessWidget {
  const SettingPageLogInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, auth, _) {
      return OptionsCard(
        title: "My Activity",
        listOfWidget: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const Reviews()));
            },
            child: const Rows(
                icon: FontAwesomeIcons.penToSquare,
                label: "Review",
                widget: null),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const MyPoints()));
            },
            child: const Rows(
                icon: FontAwesomeIcons.coins, label: "My Points", widget: null),
          ),
          Rows(
              icon: FontAwesomeIcons.qrcode,
              title: Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      auth.userModel.referal_code,
                      style: txStl(18, kPrimeColor, FontWeight.bold),
                    ),
                    const AutoSizeText(
                      "Refer to earn on every purchase from that user",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              widget: TextButton(
                  onPressed: () {
                    Share.share('check out my website https://example.com',
                        subject: 'Look what I made!');
                  },
                  child: const Text("Share"))),
        ],
      );
    });
  }
}
