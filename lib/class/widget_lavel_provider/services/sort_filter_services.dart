import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/brand_model.dart';
import 'package:universal_lab/class/model/product_master/catergory_model.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:http/http.dart' as http;
import '../../../api/api_urls.dart';
import '../sort_bar_notifier.dart';

Future filterfilter(BuildContext ctx) async {
  Provide provide = ctx.read<Provide>();
  SortBarNotifier sort = ctx.read<SortBarNotifier>();

  List<String> category =
      filterCategory(sort.selectedCategory, provide.category);
  List<String> brand = filterBrand(sort.selectedBrand, provide.brands);
  List<String> prices = filterPrice(sort.selectedPrice, p);
  List<String> discount = filterDiscount(sort.selectedDiscount, discounts);
  List<String> ratings = filterRating(sort.selectedRating, rating);

  log("$category $brand, $prices, $discount, $ratings");

  Uri url =
      Uri.parse("$filterApi$pCategory=$category$pBrand=$brand$pPrice=$prices");
  try {
    await http.Client().get(url).then((response) {
      if (response.statusCode == 200) {
        log(response.body);
        var data = jsonDecode(response.body);
        List<ItemModel> filterItems = filterItemFromJson(data);
        ctx.read<Provide>().filterItems = filterItems;
        Navigator.pop(ctx);
      } else {
        log(response.statusCode.toString());
      }
    });
  } catch (e) {
    log("+++++++++++++++++++++++++++++++++++++++++++");
    log(e.toString());
  }
}

///
List<String> filterCategory(List<bool> sort, List<CategoryModel> provide) {
  var filterCategory = List.generate(sort.length, (index) => index)
      .where((index) => sort[index])
      .map((index) => provide[index].id)
      .toList();
  return filterCategory;
}

List<String> filterRating(List<bool> sort, List<String> rating) {
  var filterRating = List.generate(sort.length, (index) => index)
      .where((index) => sort[index])
      .map((index) => rating[index])
      .toList();
  return filterRating;
}

List<String> filterBrand(List<bool> selectedBrand, List<BrandModel> brands) {
  var filterBrand = List.generate(selectedBrand.length, (index) => index)
      .where((index) => selectedBrand[index])
      .map((index) => brands[index].id)
      .toList();
  return filterBrand;
}

List<String> filterPrice(List<bool> sort, List<Map<String, dynamic>> p) {
  var trueIndex = sort.indexWhere((element) => element == true);
  Map<String, dynamic> trueItem = trueIndex == -1 ? {} : p[trueIndex];

  List<String> trueValues = trueItem.isEmpty
      ? []
      : [trueItem['min'].toString(), trueItem['max'].toString()];
  return trueValues;
}

List<String> filterDiscount(List<bool> sort, List<String> provide) {
  var filterDiscount = List.generate(sort.length, (index) => index)
      .where((index) => sort[index])
      .map((index) => provide[index])
      .toList();
  return filterDiscount;
}
