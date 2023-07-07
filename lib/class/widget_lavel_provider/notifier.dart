import 'package:flutter/material.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

import '../../screens/home_page/sub_home_page/category/category.dart';
import '../../screens/home_page/sub_home_page/my_orders/my_orders.dart';
import '../../screens/home_page/sub_home_page/settings/setting.dart';

class Notifier extends ChangeNotifier {
  int _do = 1;

  bool _willPop = false;

  int _navIndex = 0;

  bool _loading = false;

  int _pageIndicator = 0;
  int _itemImageIndicator = 0;

  bool _showPriceDetails = false;

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool tf) {
    _obscureText = tf;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  bool get showPriceDetails => _showPriceDetails;

  set showPriceDetails(bool value) {
    _showPriceDetails = value;

    notifyListeners();
  }

  UserType _userType = UserType.User;

  int get does => _do;

  set does(int i) {
    _do = i;
    notifyListeners();
  }

  bool get willPop => _willPop;

  set willPop(bool value) {
    _willPop = value;
    notifyListeners();
  }

  int get pageIndicator => _pageIndicator;

  set pageIndicator(int value) {
    _pageIndicator = value;
    notifyListeners();
  }

  int get itemImageIndicator => _itemImageIndicator;

  set itemImageIndicator(int value) {
    _itemImageIndicator = value;
    notifyListeners();
  }

  UserType get userType => _userType;

  set userType(UserType value) {
    _userType = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  int get navIndex => _navIndex;

  set navIndex(int newIndex) {
    _navIndex = newIndex;
    notifyListeners();
  }
}

extension PageGo on Notifier {
  pageGo(int index, BuildContext context) {
    switch (_navIndex) {
      case 0:
        navIndex = index;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomePage()));
      case 1:
        navIndex = index;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomePage()));
      case 2:
        navIndex = index;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomePage()));
      case 3:
        navIndex = index;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomePage()));
    }
  }
}
