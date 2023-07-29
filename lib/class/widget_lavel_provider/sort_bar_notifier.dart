import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/widget_lavel_provider/filter_option.dart';
import '../../class/model/product_master/brand_model.dart';
import '../../class/model/product_master/catergory_model.dart';
import '../../class/model/provider.dart';
import '../../class/enums.dart';
import '../../package/functions/sort_bar_functions/filter_list_widgets/filter_rating.dart';
import '../../package/functions/sort_bar_functions/open_category_sheet.dart';
import '../../package/functions/sort_bar_functions/open_sort_sheet.dart';

import '../../package/functions/sort_bar_functions/filter_list_widgets/brand_list.dart';
import '../../package/functions/sort_bar_functions/filter_list_widgets/category_list.dart';
import '../../package/functions/sort_bar_functions/filter_list_widgets/discount_list.dart';
import '../../package/functions/sort_bar_functions/filter_list_widgets/price_range.dart';
import '../../package/functions/sort_bar_functions/open_filter_sheet.dart';
import '../model/product_master/items_model.dart';

class SortBarNotifier extends ChangeNotifier {
  static late BuildContext _context;

  static void initialize(BuildContext context) => _context = context;

  List<ItemModel> _filterItems = [];
  List<ItemModel> _filteringItem = [];

  List<ItemModel> get filteringItem => _filteringItem;

  set filteringItem(List<ItemModel> value) {
    _filteringItem = value;
    notifyListeners();
  }

  List<bool> selectedCategory =
      List.filled(_context.read<Provide>().category.length, false);
  List<bool> selectedBrand =
      List.filled(_context.read<Provide>().brands.length, false);
  List<bool> selectedPrice = List.filled(p.length, false);
  List<bool> selectedDiscount = List.filled(discounts.length, false);
  List<bool> selectedRating =
      List.filled(_context.read<Provide>().brands.length, false);

  int _filterIndex = 0;
  late int _sortingIndex;
  List<FilterOption> filterOption = [];

  List<ItemModel> get filterItems => _filterItems;
  List<Map> get sortingButtons => _sortingButtons;
  List<Map> get filterList => _filterList;
  BuildContext get context => _context;
  set filterItems(List<ItemModel> value) {
    _filterItems = value;
    notifyListeners();
  }

  int get sortingIndex => _sortingIndex;

  set sortingIndex(int value) {
    _sortingIndex = value;
    notifyListeners();
  }

  int get filterIndex => _filterIndex;

  set filterIndex(int value) {
    _filterIndex = value;
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
        openCategorySheet(context);
        break;
      case 3:
        // todo:
        break;
    }
  }

  void filterFilter(ItemSearchType type, int? index) {
    if (ItemSearchType.Sort == type) {
      _filterItems = filteringItem;
      sortIngItems(index!);
    } else if (ItemSearchType.Filter == type) {
      filterIngItems();
    }
  }

  List<ItemModel> sortIngItems(int index) {
    switch (SortOptions.values[index]) {
      case SortOptions.BestSeller:
        return sortBestSeller();

      case SortOptions.PriceLowToHigh:
        return sortPriceLowToHigh();

      case SortOptions.PriceHighToLow:
        return sortPriceHighToLow();
      case SortOptions.Discount:
        return sortDiscount();

      case SortOptions.AZ:
        return sortAZ();

      case SortOptions.ZA:
        return sortZA();

      default:
        return _filteringItem;
    }
  }

  List<ItemModel> sortBestSeller() {
    _filteringItem = _filterItems;
    return _filteringItem.where((element) => element.isBestSeller).toList();
  }

  List<ItemModel> sortPriceHighToLow() {
    _filteringItem = _filterItems;
    _filteringItem.sort((a, b) => b.price.compareTo(a.price));
    return _filteringItem;
  }

  List<ItemModel> sortPriceLowToHigh() {
    _filteringItem = _filterItems;
    _filteringItem.sort((a, b) => a.price.compareTo(b.price));
    return _filteringItem;
  }

  List<ItemModel> sortDiscount() {
    _filteringItem = _filterItems;
    return _filteringItem.where((element) => element.discount > 0).toList();
  }

  List<ItemModel> sortAZ() {
    _filteringItem = _filterItems;
    _filteringItem.sort((a, b) => a.name.compareTo(b.name));
    return _filteringItem;
  }

  List<ItemModel> sortZA() {
    _filteringItem = _filterItems;
    _filteringItem.sort((a, b) => b.name.compareTo(a.name));
    return _filteringItem;
  }

  void filterIngItems() {}
}

List<Map> _sortingButtons = [
  {"label": "Sort By", "icon": FontAwesomeIcons.arrowDownWideShort},
  {"label": "Flitter", "icon": FontAwesomeIcons.filter},
  {"label": "Category", "icon": FontAwesomeIcons.arrowDown},
];

List<Map> _filterList = [
  {"label": ItemSearchType.Category, "widget": const FilterCategoryList()},
  {"label": ItemSearchType.Brand, "widget": const FilterBrandList()},
  {"label": ItemSearchType.Price, "widget": const FilterPriceRange()},
  {"label": ItemSearchType.Discount, "widget": const FlitterDiscount()},
  {"label": ItemSearchType.CustomerRating, "widget": const FilterRating()},
  // {"label": ItemSearchType.Bestseller, "widget": const Text("Best Seller")},
  // {"label": ItemSearchType.Others, "widget": const Text("Others")},
];
List<String> discounts = [
  '10',
  '20',
  '30',
  '50',
  '70',
];

List<String> rating = ["2", "3", "4", "5"];

List<String> price = [
  '1000',
  '2000',
  '5000',
  '10000',
  '20000',
  '50000',
  '100000',
  '100000',
];

List<Map<String, dynamic>> p = [
  {'min': 0, 'max': 1000},
  {'min': 1000, 'max': 2000},
  {'min': 2000, 'max': 5000},
  {'min': 5000, 'max': 10000},
  {'min': 10000, 'max': 20000},
  {'min': 20000, 'max': 50000},
  {'min': 50000, 'max': 100000},
  {'min': 100000, 'max': 500000},
  {'min': 500000, 'max': 'above'},
];
