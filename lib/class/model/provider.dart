// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer' as l;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/product_master/brand_model.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';

import 'order/order_model.dart';
import 'product_master/catergory_model.dart';
import 'product_master/marquee_master.dart';
import 'product_master/shipping_model.dart';
import 'product_master/sub_category_model.dart';

class Provide extends ChangeNotifier {
  List<ShippingModel> _shippingCharges = [];
  List<SubCategoryModel> _subCategory = [];
  List<ItemModel> _staticFilterItem = [];
  List<OrderModel> _currentOrder = [];
  List<CategoryModel> _category = [];
  List<ItemModel> _filterItems = [];
  List<OrderModel> _pastOrder = [];
  List<BrandModel> _brands = [];
  List<Marquees> _marquee = [];
  List<ItemModel> _items = [];
  late String itemSearchType;

  /// ---------------------------------------------------------- [_currentOrder]

  List<OrderModel> get currentOrder => _currentOrder;

  set currentOrder(List<OrderModel> value) {
    _currentOrder = value;
    notifyListeners();
  }

  /// ---------------------------------------------------------- [_pastOrder]

  List<OrderModel> get pastOrder => _pastOrder;

  set pastOrder(List<OrderModel> value) {
    _pastOrder = value;
    notifyListeners();
  }

  /// ---------------------------------------------------------- [ShippingModel]

  List<ShippingModel> get shippingCharges => _shippingCharges;

  set shippingCharges(List<ShippingModel> value) {
    _shippingCharges = value;
    notifyListeners();
  }

  /// ------------------------------------------------------ [_staticFilterItem]
  List<ItemModel> get staticFilterItem => _staticFilterItem;

  set staticFilterItem(List<ItemModel> value) {
    _staticFilterItem = value;
    notifyListeners();
  }

  /// ---------------------------------------------------------------- [Marquee]
  List<Marquees> get marquee => _marquee;

  set marquee(List<Marquees> value) {
    _marquee = value;
    notifyListeners();
  }

  /// -------------------------------------------------------------- [ItemModel]
  List<ItemModel> get items => _items;

  set items(List<ItemModel> value) {
    _items = value;
    notifyListeners();
  }

  /// ------------------------------------------------------------- [BrandModel]
  List<BrandModel> get brands => _brands;

  BrandModel brand(String id) {
    return _brands.firstWhere((element) => element.id == id);
  }

  set brands(List<BrandModel> value) {
    _brands = value;
    notifyListeners();
  }

  /// ---------------------------------------------------------- [CategoryModel]
  List<CategoryModel> get category => _category;

  set category(List<CategoryModel> value) {
    _category = value;
    notifyListeners();
  }

  /// ------------------------------------------------------- [SubCategoryModel]
  List<SubCategoryModel> get subCategory => _subCategory;

  set subCategory(List<SubCategoryModel> value) {
    _subCategory = value;
    notifyListeners();
  }

  /// ------------------------------------------------------------ [filterItems]
  List<ItemModel> get filterItems => _filterItems;

  set filterItems(List<ItemModel> value) {
    _filterItems = value;
    notifyListeners();
  }

  /// -------------------------------------------------------------- [functions]
  CategoryModel getCategoryFromId(String id) {
    var data = _category.firstWhere((element) => element.id == id);
    return data;
  }

  getBestSeller() {
    var bestSeller = _items.where((element) => element.isBestSeller).toList();
    return bestSeller;
  }

  getBestOffers() {
    List<ItemModel> bestOffers =
        _items.where((element) => element.discount != 0).toList();
    return bestOffers;
  }

  getItemsFromCategoryId(String id) {
    _filterItems = _staticFilterItem =
        _items.where((element) => element.categoryId == id).toList();
    notifyListeners();
  }

  getItemsFromSubcategoryId(String id) {
    _filterItems = _staticFilterItem =
        _items.where((element) => element.subCategoryId == id).toList();
    notifyListeners();
  }

  getItemsFromBrandId(String id) {
    _filterItems = _staticFilterItem =
        _items.where((element) => element.brandId == id).toList();
    notifyListeners();
  }

  getItemsByBestSeller() {
    _filterItems = _staticFilterItem =
        _items.where((element) => element.isBestSeller).toList();
    notifyListeners();
  }

  getItemsByDiscount() {
    _filterItems = _staticFilterItem =
        _items.where((element) => element.discount > 0).toList();
    notifyListeners();
  }

  sortBestSeller() {
    _filterItems = _staticFilterItem;
    _filterItems =
        _filterItems.where((element) => element.isBestSeller).toList();
    notifyListeners();
  }

  sortPriceHighToLow() {
    _filterItems = _staticFilterItem;

    _filterItems.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  sortPriceLowToHigh() {
    _filterItems = _staticFilterItem;
    _filterItems.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  sortDiscount() {
    _filterItems = _staticFilterItem;

    _filterItems =
        _filterItems.where((element) => element.discount > 0).toList();
    notifyListeners();
  }

  sortAZ() {
    _filterItems = _staticFilterItem;

    _filterItems.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  sortZA() {
    _filterItems = _staticFilterItem;

    _filterItems.sort((a, b) => b.name.compareTo(a.name));
    notifyListeners();
  }

  void itemsFromSearchType(ItemSearchType type, String id) {
    switch (type) {
      case ItemSearchType.Category:
        l.log(type.name);
        getItemsFromCategoryId(id);
      case ItemSearchType.Subcategory:
        l.log(type.name);
        getItemsFromSubcategoryId(id);
      case ItemSearchType.Brand:
        l.log(type.name);
        getItemsFromBrandId(id);
      case ItemSearchType.Bestseller:
        l.log(type.name);
        getItemsByBestSeller();
      case ItemSearchType.Discount:
        l.log(type.name);
        getItemsByDiscount();
      case ItemSearchType.Sort:
        l.log(type.name);
        sortIngItems(int.parse(id));
      default:
        l.log(type.name);
        _filterItems = _staticFilterItem = _items;
        notifyListeners();
        break;
    }
  }

  void sortIngItems(int index) {
    switch (SortOptions.values[index]) {
      case SortOptions.BestSeller:
        sortBestSeller();
      case SortOptions.PriceLowToHigh:
        sortPriceLowToHigh();
      case SortOptions.PriceHighToLow:
        sortPriceHighToLow();
      case SortOptions.Discount:
        sortDiscount();
      case SortOptions.AZ:
        sortAZ();
      case SortOptions.ZA:
        sortZA();
      default:
        break;
    }
  }

  Object? groupedBy(ItemSearchType type, String id) {
    var data;
    switch (type) {
      case ItemSearchType.Category:
        data = _category.firstWhere((element) => element.id == id);
        return data.name;
      case ItemSearchType.Subcategory:
        data =
            _subCategory.firstWhere((element) => element.subCategoryId == id);
        return data.name;
      case ItemSearchType.Brand:
        data = _brands.firstWhere((element) => element.id == id);
        return data.name;
      case ItemSearchType.Bestseller:
        return "Our Bestsellers";
      case ItemSearchType.Discount:
        data = "Best Offers UP TO";
        return data;
      default:
        return "Our Products";
    }
  }

  ItemModel getItemFromId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  String getProductImage(String productId) {
    l.log(_items
        .firstWhere((element) => element.id == productId.toString())
        .image
        .toString());

    return _items
        .firstWhere((element) => element.id == productId.toString())
        .image;
  }
}
