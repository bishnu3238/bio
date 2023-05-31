import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:universal_lab/class/user/auth_service.dart';

class ExtraLogInMethode extends StatelessWidget {
  const ExtraLogInMethode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, auth, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton.mini(
                buttonType: ButtonType.google, onPressed: () => auth.googleSignIn()),
            SignInButton.mini(
                buttonType: ButtonType.mail, onPressed: () {}),
            SignInButton.mini(
                buttonType: ButtonType.facebook, onPressed: () {}),
          ],
        );
      }
    );
  }
}
