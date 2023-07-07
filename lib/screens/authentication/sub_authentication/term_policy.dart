import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';

class Terms extends StatelessWidget {
  final Function(Term)? onEvent;
  const Terms({Key? key, this.onEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "By continuing, you agree to $appName's\n",
            style: theme.titleMedium!.copyWith(
                color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 13),
            children: [
              TextSpan(
                  // onEnter: (enter) => onEvent(Term.TermsAndCondition),
                  text: "Terms & Conditions",
                  style: theme.titleMedium!
                      .copyWith(color: Colors.deepOrange, fontSize: 12)),
              TextSpan(text: " & ", style: theme.labelLarge),
              TextSpan(
                  // onEnter: (enter) => onEvent(Term.PrivacyPolicy),
                  text: "Privacy Policy",
                  style: theme.titleMedium!
                      .copyWith(color: Colors.deepOrange, fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}
