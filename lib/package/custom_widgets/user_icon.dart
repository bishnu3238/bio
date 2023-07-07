import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/size_config.dart';

import '../functions/user_pop_up.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';
import 'custom_image.dart';

var img =
    "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80";

class UserIcon extends StatefulWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  State<UserIcon> createState() => _UserIconState();
}

class _UserIconState extends State<UserIcon> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (ctx, user, _) {
        if (user.authStatus == AuthStatus.Login) {
          return FittedBox(
            child: InkWell(
              onTap: () {
                // Functions.initialize(context);
                userPopUp(context);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 8, 5),
                child: CircleAvatar(
                  backgroundColor: kR400.withOpacity(0.1),
                  radius: getProportionateScreenWidth(10),
                  child: user.user!.photoURL.isEmpty
                      ? Icon(
                          FontAwesomeIcons.user,
                          color: kDBlue,
                          size: getProportionateScreenWidth(10),
                        )
                      : CustomImage(
                          user.user!.photoURL,
                          radius: 50,
                          width: getProportionateScreenWidth(18),
                          height: getProportionateScreenWidth(18),
                        ),
                ),
              ),
            ),
          );
        } else {
          return IconButton(
            onPressed: () {
              context.read<Notifier>().navIndex = 3;
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (ctx) => HomePage()));
            },
            icon: Icon(
              FontAwesomeIcons.solidUser,
              size: getProportionateScreenWidth(25),
            ),
          );
        }
      },
    );
  }
}
