import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../class/widget_lavel_provider/notifier.dart';
import '../../../package/text_style.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (context, bottomNavIndexNotifier, child) {
        return BottomNavigationBar(
          elevation: 5,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue.shade900,
          currentIndex: bottomNavIndexNotifier.navIndex,
          unselectedItemColor: Colors.blueGrey.withOpacity(0.4),
          selectedLabelStyle: navTxStl(12, Colors.blue.shade900, null),
          unselectedLabelStyle: txStl(12, Colors.black, FontWeight.w900),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tableCells),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bell),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bagShopping),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear),
              label: 'Setting',
            ),
          ],
          onTap: (int index) {
            bottomNavIndexNotifier.navIndex = index;
            bottomNavIndexNotifier.willPop = index == 0;
          },
        );
      },
    );
  }
}
