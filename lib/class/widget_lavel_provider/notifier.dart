import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/package/functions/sort_bar_functions/open_sort_sheet.dart';

import '../../package/functions/sort_bar_functions/filter_list_widgets/brand_list.dart';
import '../../package/functions/sort_bar_functions/filter_list_widgets/category_list.dart';
import '../../package/functions/sort_bar_functions/filter_list_widgets/price_range.dart';
import '../../package/functions/sort_bar_functions/open_filter_sheet.dart';

class Notifier extends ChangeNotifier {
  bool _willPop = false;

  int _navIndex = 0;

  bool _loading = false;

  int _pageIndicator = 0;

  int _filterIndex = 0;

  int get filterIndex => _filterIndex;

  set filterIndex(int value) {
    _filterIndex = value;
    notifyListeners();
  }

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
        openFilterSheet(context);
      // break;
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

  List<Map> filterList = [
    {"label": "Relevance", "widget": const Text("Relevance")},
    {"label": "Category", "widget": const FilterCategoryList()},
    {"label": "Brands", "widget": const FilterBrandList()},
    {"label": "Price", "widget": const FilterPriceRange()},
    {"label": "Discount", "widget": const Text("Relevance")},
    {"label": "Customer Rating", "widget": const Text("Relevance")},
    {"label": "Best Seller", "widget": const Text("Relevance")},
    {"label": "Others", "widget": const Text("Relevance")},
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
