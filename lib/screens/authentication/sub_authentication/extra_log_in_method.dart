import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';

import '../../../class/app_constant.dart';

class ExtraLogInMethode extends StatelessWidget {
  const ExtraLogInMethode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, auth, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(
            shape: kRoundRadius(),
            buttonType: ButtonType.google,
            onPressed: () => auth.googleSignIn(),
          ),
          // TODO: add more sign in methode
          // SignInButton(
          //   shape: kRoundRadius(),
          //   buttonType: ButtonType.mail,
          //   btnText: 'Sign in with Email',
          //   btnColor: kError.withOpacity(0.4),
          //   onPressed: () => Navigator.push(context,
          //       MaterialPageRoute(builder: (ctx) => const EmailSignIn())),
          // ),
        ],
      );
    });
  }
}
