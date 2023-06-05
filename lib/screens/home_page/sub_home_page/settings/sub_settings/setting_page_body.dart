import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';

import '../../../../../class/enums.dart';
import '../../../../../package/custom_widgets/divide.dart';
import '../../../../../package/size_config.dart';
import 'options_card.dart';
import 'setting_page_header.dart';

class SettingPageBody extends StatefulWidget {
  const SettingPageBody({Key? key}) : super(key: key);

  @override
  State<SettingPageBody> createState() => _SettingPageBodyState();
}

class _SettingPageBodyState extends State<SettingPageBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, auth, _) {
      return Column(
        children: [
          auth.authStatus == AuthStatus.Login
              ? const OptionsCard(
                  title: "My Activity",
                  listOfWidget: [
                    Rows(
                        icon: FontAwesomeIcons.penToSquare,
                        label: "Review",
                        widget: null),
                    Rows(
                        icon: FontAwesomeIcons.coins,
                        label: "My Coins",
                        widget: null),
                  ],
                )
              : const SizedBox.shrink(),
          const Divide(color: Colors.white30),
          const OptionsCard(
            title: "Feedback & Information",
            listOfWidget: [
              Rows(
                  icon: FontAwesomeIcons.fileContract,
                  label: "Terms, Policies and Licenses",
                  widget: null),
              Rows(
                  icon: FontAwesomeIcons.circleQuestion,
                  label: "Browse FAQs",
                  widget: null),
            ],
          ),
          const Divide(color: Colors.white30),
          const Rows(
              icon: FontAwesomeIcons.headphones,
              label: "Help Centre",
              widget: Card(
                elevation: 0,
                color: Color(0x81C5E3FF),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    "New",
                  ),
                ),
              )),
          auth.authStatus == AuthStatus.Login
              ? Container(
                  width: getProportionateScreenWidth(375),
                  padding: const EdgeInsets.all(10),
                  child: Buttons(
                    text: "Log out",
                    onTap: () {
                      context.read<AuthService>().signOut();
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      );
    });
  }
}
