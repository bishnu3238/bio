import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user/auth_service.dart';

import '../../screens/authentication/log_in.dart';
import '../navigate.dart';

var img =
    "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80";

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (ctx, user, _) {
        if (user.authStatus == AuthStatus.Login) {
          return CircleAvatar(
            backgroundImage: NetworkImage(img),
          );
        } else {
          return IconButton(
              onPressed: () {
                Navigate.go(context, const LogIn());
              },
              icon: const FaIcon(FontAwesomeIcons.circleUser));
        }
      },
    );
  }
}
