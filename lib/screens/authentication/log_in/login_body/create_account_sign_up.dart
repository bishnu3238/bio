import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/screens/authentication/sign_up/sign_up.dart';

import '../../../../class/app_constant.dart';

class CreateAccountSignUp extends StatelessWidget {
  const CreateAccountSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsIcon(
      color: kLight,
      text: 'Create a New Account',
      icon: FontAwesomeIcons.arrowRightToBracket,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => const SignupPage()),
        ),

    );
  }
}
