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
          onTap: (int index) {
            bottomNavIndexNotifier.navIndex = index;
            bottomNavIndexNotifier.willPop = index == 0;
          },
          currentIndex: bottomNavIndexNotifier.navIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue.shade900,
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
        );
        // ;
        //   SafeArea(
        //     child: Padding(
        //   padding: const EdgeInsets.all(8),
        //   child: Container(
        //     padding: const EdgeInsets.all(12),
        //     margin: const EdgeInsets.symmetric(horizontal: 10),
        //     decoration: const BoxDecoration(
        //         color: Colors.black,
        //         borderRadius: BorderRadius.all(Radius.circular(16))),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         BotomNavWidget(
        //           onTap: () {},
        //           icon: FontAwesomeIcons.house,
        //         ),
        //         BotomNavWidget(
        //           onTap: () {},
        //           icon: FontAwesomeIcons.magnifyingGlass,
        //         ),
        //         BotomNavWidget(
        //           onTap: () {},
        //           icon: FontAwesomeIcons.dashcube,
        //         ),
        //         BotomNavWidget(
        //           onTap: () {},
        //           icon: FontAwesomeIcons.opencart,
        //         ),
        //         BotomNavWidget(
        //           onTap: () {},
        //           icon: FontAwesomeIcons.vest,
        //         ),
        //       ],
        //     ),
        //   ),
        // ));
      },
    );
  }
}
