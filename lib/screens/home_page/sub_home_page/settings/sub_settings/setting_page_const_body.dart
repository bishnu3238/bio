import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/app_constant.dart';
import '../../../../../package/custom_widgets/divide.dart';
import '../../../../terms/brows_faqs.dart';
import '../../../../terms/help_center.dart';
import '../../../../terms/terms_and_condition.dart';
import 'options_card.dart';

class SettingPageConstBody extends StatelessWidget {
  const SettingPageConstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divide(color: Colors.white30),
        OptionsCard(
          title: "Feedback & Information",
          listOfWidget: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const TermsAndCondition()));
              },
              child: const Rows(
                  icon: FontAwesomeIcons.fileContract,
                  label: "Terms, Policies and Licenses",
                  widget: null),
            ),
            gap(18),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const BrowseFAQS()));
              },
              child: const Rows(
                  icon: FontAwesomeIcons.circleQuestion,
                  label: "Browse FAQs",
                  widget: null),
            ),
          ],
        ),
        const Divide(color: Colors.white30),
        gap(18),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const HelpCenter()));
          },
          child: const Rows(
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
            ),
          ),
        ),
      ],
    );
  }
}
