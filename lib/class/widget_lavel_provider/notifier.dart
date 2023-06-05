import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/package/functions/sort_bar_functions/open_sort_sheet.dart';

class Notifier extends ChangeNotifier {
  bool _willPop = false;

  int _navIndex = 0;

  bool _loading = false;

  int _pageIndicator = 0;

  UserType _userType = UserType.User;

  late int _sortingIndex;

  int get sortingIndex => _sortingIndex;

  set sortingIndex(int value) {
    _sortingIndex = value;
    notifyListeners();
  }

  void onSortingBarTap(context) {
    switch (_sortingIndex) {
      case 0:
        openSortSheet(context);
        break;
      case 1:
        // todo:
        // openFiltterSheet(context);
        break;
      case 2:
        // todo:
        break;
      case 3:
        // todo:
        break;
    }
  }

  List<Map> sortingButtons = [
    {"label": "Sort By", "icon": FontAwesomeIcons.arrowDownWideShort},
    {"label": "Flitter", "icon": FontAwesomeIcons.filter},
    {"label": "Category", "icon": FontAwesomeIcons.arrowDown},
    {"label": "Brands", "icon": FontAwesomeIcons.brandsFontAwesome},
  ];

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
