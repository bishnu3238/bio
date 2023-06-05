import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_widgets/divide.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../../authentication/log_in.dart';

class SettingPageHeader extends StatelessWidget {
  const SettingPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (ctx, auth, _) {
      log(auth.authStatus.name);
      return Container(
        child: auth.authStatus == AuthStatus.Logout
            ? const LogOutHeader()
            : const LogInHeader(),
      );
    });
  }
}

class LogOutHeader extends StatelessWidget {
  const LogOutHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ElevatedButton(
          onPressed: () {
            Navigate.go(context, const LogIn());
          },
          child: const Text("Log In")),
    );
  }
}

class LogInHeader extends StatelessWidget {
  const LogInHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, auth, _) {
        return Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              onTap: () {},
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              leading: SizedBox(
                width: getProportionateScreenWidth(60),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned.fill(
                        child: CircleAvatar(
                            radius: 30,
                            child: auth.user!.photoURL.isEmpty
                                ? const Icon(FontAwesomeIcons.user)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      auth.user!.photoURL,
                                      fit: BoxFit.fill,
                                    ),
                                  ))),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              title: auth.user!.email.isNotEmpty
                  ? Text(auth.user!.email)
                  : auth.user!.name.isNotEmpty
                      ? Text(auth.user!.name)
                      : auth.user!.phoneNO.isNotEmpty
                          ? Text(auth.user!.phoneNO)
                          : Text(auth.user!.uid),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.angleRight,
                    color: kDBlue,
                  )),
            ),
            const Divide(color: Colors.white30),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.addressBook,
                          text: "Address",
                          onTap: () {},
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.user,
                          text: "Profile",
                          onTap: () {},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.list,
                          text: "Wishlist",
                          onTap: () {},
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.infinity,
                          text: "Coupons",
                          onTap: () {},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        );
      },
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final Color? color;

  final VoidCallback? onTap;
  const Buttons({Key? key, required this.text, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(onTap == null ? null : color),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(10, 12, 10, 12))),
          child: Text(
            text,
            style: stlBtn(color == null
                ? Colors.white
                : color == Colors.white
                    ? kDBlue
                    : Colors.white),
          )),
    );
  }
}

class ButtonsIcon extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData? icon;

  final VoidCallback? onTap;
  const ButtonsIcon(
      {Key? key, required this.text, this.color, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon:
            Icon(icon, color: color == null ? Colors.white : kDBlue, size: 18),
        onPressed: onTap,
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
        label: Text(
          text,
          style: stlBtn(kDBlue),
        ));
  }
}
