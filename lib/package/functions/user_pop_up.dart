import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/home/home.dart';
import '../../screens/home_page/sub_home_page/notification/notification.dart';
import '../../screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../../screens/user/profile/user_profile.dart';

// class Functions {
//   static late BuildContext _context;
//   static void initialize(BuildContext context) => _context = context;

void userPopUp(BuildContext context, [bool isRight = true]) async {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = isRight
      ? RelativeRect.fromRect(
          Rect.fromPoints(
            overlay.localToGlobal(overlay.size.topRight(Offset.zero),
                ancestor: overlay),
            overlay.localToGlobal(overlay.size.topRight(Offset.zero),
                ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        )
      : RelativeRect.fromRect(
          Rect.fromPoints(
            overlay.localToGlobal(overlay.size.topLeft(Offset.zero),
                ancestor: overlay),
            overlay.localToGlobal(overlay.size.topLeft(Offset.zero),
                ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

  Future.microtask(() async {
    final result = await showMenu(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      items: [
        PopupMenuItem(
          child: const Rows(icon: FontAwesomeIcons.person, label: "Profile"),
          onTap: () {
            Future.delayed(
              const Duration(milliseconds: 200),
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const UserProfile()),
                );
              },
            );
          },
        ),
        PopupMenuItem(
          child: const Rows(
              icon: FontAwesomeIcons.noteSticky, label: "Notification"),
          onTap: () {
            Future.delayed(
                const Duration(milliseconds: 100),
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const Notifications())));
          },
        ),
        PopupMenuItem(
          child: const Rows(icon: FontAwesomeIcons.gears, label: "Setting"),
          onTap: () {
            Future.delayed(
                const Duration(milliseconds: 100),
                () => Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      context.read<Notifier>().navIndex = 3;

                      return const HomePage();
                    })));
          },
        ),
        PopupMenuItem(
          child: const Rows(icon: FontAwesomeIcons.hireAHelper, label: "Help"),
          onTap: () {},
        ),
        PopupMenuItem(
          child: const Divider(height: 0),
          onTap: () {},
        ),
        PopupMenuItem(
          child: const Rows(
            icon: FontAwesomeIcons.arrowRightFromBracket,
            label: "Log out",
            widget: SizedBox(),
          ),
          onTap: () {
            Future.delayed(
              const Duration(milliseconds: 200),
              () {
                AuthService.initialize(context);
                context.read<AuthService>().signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const LoadingScreen(),
                  ),
                );
              },
            );
          },
        ),
      ],
    );

    if (result != null) {
      log(result.toString());
    }
  });
}
// }
