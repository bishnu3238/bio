import 'dart:developer' as l;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/product_master/brand_model.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';

import 'product_master/catergory_model.dart';
import 'product_master/sub_category_model.dart';

class Provide extends ChangeNotifier {
  List<SubCategoryModel> _subCategory = [];
  List<CategoryModel> _category = [];
  List<BrandModel> _brands = [];
  List<ItemModel> _items = [];

  List<ItemModel> get items => _items;

  set items(List<ItemModel> value) {
    _items = value;
    notifyListeners();
  }

  List<BrandModel> get brands => _brands;

  set brands(List<BrandModel> value) {
    _brands = value;
    notifyListeners();
  }

  List<CategoryModel> get category => _category;

  set category(List<CategoryModel> value) {
    _category = value;
    notifyListeners();
  }

  List<SubCategoryModel> get subCategory => _subCategory;

  set subCategory(List<SubCategoryModel> value) {
    _subCategory = value;
    notifyListeners();
  }

  dummyData() {
    var faker = Faker();
    var item = List.generate(
        50,
        (index) => ItemModel(
            id: "$index",
            name: faker.currency.name(),
            image: randomImageUrl[index],
            price: Random.secure().nextInt(50000).roundToDouble(),
            description: "Item $index description",
            discount: Random.secure().nextInt(20).roundToDouble(),
            brandId: Random.secure().nextInt(brandName.length).toString(),
            categoryId: Random.secure().nextInt(catagorys.length).toString(),
            isBestSeller: faker.randomGenerator.boolean(),
            rating: 0.0));
    _items = item;

    var cat = List.generate(
        catagorys.length,
        (index) => CategoryModel(
            id: "$index",
            name: catagorys[index]['name'],
            image: catagorys[index]['image'])); //
    _category = cat;
    var bra = List.generate(
        brandName.length,
        (index) => BrandModel(
            id: "$index", name: brandName[index], image: brandLogos[index])); //
    _brands = bra;
  }

  CategoryModel getCategoryFromId(String id) {
    var data = _category.firstWhere((element) => element.id == id);
    return data;
  }

  static List catagorys = [
    {
      "name": "Glass Ware",
      "image": "glass_waree.png",
    },
    {
      "name": "Plastic Ware",
      "image": "plastic_ware.png",
    },
    {
      "name": "Lab Instrument",
      "image": "lab_instruments.png",
    },
    {
      "name": "Lab Ware",
      "image": "lab_ware.png",
    },
    {
      "name": "Filtering Aids",
      "image": "filtering_aid.png",
    },
    {
      "name": "Pathology Items",
      "image": "pathology_item.png",
    },
    {
      "name": "Chemicals",
      "image": "chemical.png",
    },
    {
      "name": "Surgical Items",
      "image": "lab_ware.png",
    }
  ];

  getBestSeller() {
    var bestSeller = _items.where((element) => element.isBestSeller).toList();
    return bestSeller;
  }

  getBestOffers() {
    List<ItemModel> bestOffers =
        _items.where((element) => element.discount != 0).toList();
    return bestOffers;
  }

  List<ItemModel> getItemsFromCategoryId(String id) {
    List<ItemModel> items =
        _items.where((element) => element.categoryId == id).toList();
    return items;
  }

  List<ItemModel> getItemsFromSubcategoryId(String id) {
    List<ItemModel> items =
        _items.where((element) => element.subCategoryId == id).toList();
    return items;
  }

  List<ItemModel> getItemsFromBrandId(String id) {
    List<ItemModel> items =
        _items.where((element) => element.brandId == id).toList();
    return items;
  }

  List<ItemModel> getItemsByBestSeller() {
    List<ItemModel> items =
        _items.where((element) => element.isBestSeller).toList();
    return items;
  }

  List<ItemModel> getItemsByDiscount() {
    List<ItemModel> items =
        _items.where((element) => element.discount > 0).toList();
    return items;
  }

  List<ItemModel> getItemsFromSearchType(ItemSearchType type, String id) {
    switch (type) {
      case ItemSearchType.Category:
        l.log(type.name);
        return getItemsFromCategoryId(id);
      case ItemSearchType.Subcategory:
        l.log(type.name);

        return getItemsFromSubcategoryId(id);
      case ItemSearchType.Brand:
        l.log(type.name);

        return getItemsFromBrandId(id);
      case ItemSearchType.Bestseller:
        l.log(type.name);

        return getItemsByBestSeller();
      case ItemSearchType.Discount:
        l.log(type.name);

        return getItemsByDiscount();
      default:
        l.log(type.name);

        return _items;
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
}

// static List<Map> brand = List.generate(brandName.length,
//     (index) => {"name": brandName[index], "image": brandLogos[index]});

// [
//   {"name": "Berosil", "image": "berosil.jpg"},
//   {"name": "Merck", "image": "dimond.jpg"},
//   {"name": "Microlits", "image": "microlit.jpg"},
//   {"name": "Hichs", "image": "empty_cart.png"},
//   {"name": "Bluestar", "image": "berosil.jpg"},
//   {"name": "Himedia", "image": "himedia_logo.png"},
//   {"name": "Tarsons", "image": "tarsons.jpg"},
//   {"name": "Polylas", "image": "phonology.jpg"},
//   {"name": "Remi", "image": "download.jpg"},
//   {"name": "Labman", "image": "berosil.jpg"},
//   {"name": "Azlet", "image": "empty_cart.png"},
//   {"name": "Indicator", "image": "berosil.jpg"},
//   {"name": "phonology", "image": "phonology.jpg"},
//   {"name": "Stambio", "image": "fluka.jpg"},
//   {"name": "Oxy 99", "image": "vaku-8.jpg"},
//   {"name": "Sigma", "image": "sigma.jpg"},
//   {"name": "Nice", "image": "himedia_logo.jpg"},
// ];
