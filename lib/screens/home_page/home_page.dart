import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/screens/home_page/home/setting.dart';

import '../../class/widget_lavel_provider/notifier.dart';
import '../../package/custom_snack_bar.dart';
import '../../package/size_config.dart';
import 'home/category.dart';
import 'home/home.dart';
import 'sub_home_page/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  // static bool isFirst = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CustomSnackBar.initialize(context);

    return Consumer<Notifier>(
      builder: (context, index, _) {
        return WillPopScope(
          onWillPop: () async {
            return await _onWillPopScope(index);
            // if (value && isFirst) return true;
            // return index.navIndex == 0 ? true : false;
          },
          child: Scaffold(
            body: [
              const Home(),
              const Category(),
              SafeArea(child: Container(color: Colors.red, child: Text("tw"))),
              SafeArea(child: Container(color: Colors.red, child: Text("th"))),
              Settings()
            ][index.navIndex],
            bottomNavigationBar: const BottomNavBar(),
          ),
        );
      },
    );
  }

  Future<bool> _onWillPopScope(Notifier navIndex) async {

    if (navIndex.navIndex == 0) {
      if (!navIndex.willPop) {
        CustomSnackBar.showToast(
            "tap again to exit the app", Colors.black38);
        return false;
      } else {
        return true;
      }
    } else if (navIndex.navIndex == 1) {
      navIndex.navIndex = 0;
      return false;
    } else if (navIndex.navIndex == 2) {
      navIndex.navIndex = 1;
      return false;
    } else if (navIndex.navIndex == 3) {
      navIndex.navIndex = 2;
      return false;
    } else if (navIndex.navIndex == 4) {
      navIndex.navIndex = 3;
      return false;
    }
    return false;
  }
}
