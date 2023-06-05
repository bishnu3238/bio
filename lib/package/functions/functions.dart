import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_widgets/divide.dart';
import '../../screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

class Functions {
  static late BuildContext _context;
  static void initialize(BuildContext context) => _context = context;

  static void userPopUp() {
    final RenderBox overlay =
        Overlay.of(_context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        overlay.localToGlobal(overlay.size.topRight(Offset.zero),
            ancestor: overlay),
        overlay.localToGlobal(overlay.size.topRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: _context,
      position: position,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      items: [
        PopupMenuItem(
          child: const Rows(icon: FontAwesomeIcons.person, label: "Profile"),
          onTap: () {},
        ),
        PopupMenuItem(
          child: const Rows(icon: FontAwesomeIcons.gears, label: "Setting"),
          onTap: () {},
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
              widget: Text("")),
          onTap: () => _context.read<AuthService>().signOut(),
        ),
      ],
    );
  }
}
