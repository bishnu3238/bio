// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:universal_lab/methods/static_methods.dart';

import '../../app_constant.dart';

List<ItemModel> itemsFromJson(dynamic jsonData) =>
    List<ItemModel>.from(jsonData['Data'].map((e) => ItemModel.fromMap(e)));

List<ItemModel> filterItemFromJson(dynamic jsonData) =>
    List<ItemModel>.from(jsonData.map((e) => ItemModel.fromFilter(e)));

class ItemModel {
  final String id, name, categoryId, brandId, title, sub_title, image;
  final double price, final_price, total_quantity, rating, discount;
  final String description, offerPeriod, status;
  final String? subCategoryId;
  final bool isBestSeller;
  final DateTime time;
  final DateTime date;

//<editor-fold desc="Data Methods">
  const ItemModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.brandId,
    required this.title,
    required this.sub_title,
    required this.image,
    required this.price,
    required this.final_price,
    required this.total_quantity,
    required this.rating,
    required this.discount,
    required this.description,
    required this.offerPeriod,
    required this.status,
    this.subCategoryId,
    required this.isBestSeller,
    required this.time,
    required this.date,
  });

  ItemModel copyWith({
    String? id,
    String? name,
    String? categoryId,
    String? brandId,
    String? title,
    String? sub_title,
    String? image,
    double? price,
    double? final_price,
    double? total_quantity,
    double? rating,
    double? discount,
    String? description,
    String? offerPeriod,
    String? status,
    String? subCategoryId,
    bool? isBestSeller,
    DateTime? time,
    DateTime? date,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      title: title ?? this.title,
      sub_title: sub_title ?? this.sub_title,
      image: image ?? this.image,
      price: price ?? this.price,
      final_price: final_price ?? this.final_price,
      total_quantity: total_quantity ?? this.total_quantity,
      rating: rating ?? this.rating,
      discount: discount ?? this.discount,
      description: description ?? this.description,
      offerPeriod: offerPeriod ?? this.offerPeriod,
      status: status ?? this.status,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
      'sub_category_id': brandId,
      'title': title,
      'sub_title': sub_title,
      'image': image,
      'price': price,
      'final_price': final_price,
      'quantity': total_quantity,
      'rating': rating,
      'discount': discount,
      'description': description,
      'offer_period': offerPeriod,
      'status': status,
      'subcategory_id': subCategoryId,
      'isBestSeller': isBestSeller,
      'time': time,
      'date': date,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic>? map) {
    return ItemModel(
      id: map == null ? "" : "${map['id']}",
      name: map == null ? "" : map['title'] ?? "",
      brandId: map == null ? "" : map['sub_category_id'] as String,
      categoryId: map == null ? "" : map['category_id'] as String,
      subCategoryId: map == null ? "" : map['subcategory_id'] ?? "",
      title: map == null ? "" : map['title'] as String,
      sub_title: map == null ? "" : map['sub_title'] as String,
      description: map == null ? "" : map['description'] as String,
      price: map == null ? 0.0 : double.tryParse(map['price']) ?? 0,
      final_price: map == null ? 0.0 : double.tryParse(map['final_price']) ?? 0,
      total_quantity: map == null ? 0.0 : double.tryParse(map['quantity']) ?? 0,
      rating: map == null ? 0.0 : double.tryParse(map['rating']) ?? 0.0,
      discount: map == null ? 0.0 : double.tryParse(map['discount']) ?? 0,
      image: map == null
          ? ""
          : "$itemImgDir/${map['image'].split('.')[0]}/${map['image']}",
      offerPeriod: map == null ? "" : map['offer_period'] as String,
      status: map == null ? "" : map['status'] as String,
      isBestSeller: map == null
          ? false
          : map['best_seller'] == "0"
              ? false
              : true,
      date: map == null ? DateTime.now() : DateTime.parse(map['date']),
      time: map == null
          ? DateTime.now()
          : DateFormat('HH:mm:ss').parse(map['time']),
    );
  }

  factory ItemModel.fromCart(Map<String, dynamic>? map) {
    return ItemModel(
      id: map == null ? "" : map['id'] as String,
      name: map == null ? "" : map['name'] as String,
      brandId: map == null ? "" : map['sub_category_id'] as String,
      categoryId: map == null ? "" : map['category_id'] as String,
      subCategoryId: map == null ? "" : map['subcategory_id'] ?? "",
      title: map == null ? "" : map['title'] as String,
      sub_title: map == null ? "" : map['sub_title'] as String,
      description: map == null ? "" : map['description'] as String,
      price: map == null ? 0.0 : map['price'] as double,
      final_price: map == null ? 0.0 : map['final_price'] as double,
      total_quantity: map == null ? 0.0 : map['quantity'] as double,
      rating: map == null ? 0.0 : map['rating'] ?? 0.0,
      discount: map == null ? 0.0 : map['discount'] as double,
      image: map == null ? "" : map['image'] as String,
      offerPeriod: map == null ? "" : map['offer_period'] ?? "",
      status: map == null ? "" : map['status'] as String,
      // quantity: map == null ? 0 : map['quantity'] ?? 0,
      isBestSeller: map == null ? false : map['isBestSeller'] as bool,
      date: map == null ? DateTime.now() : convertDate(map['date']),
      time: map == null ? DateTime.now() : convertTime(map['time']),
    );
  }

  factory ItemModel.fromFilter(Map<String, dynamic> e) {
    return ItemModel(
        id: e['id'],
        name: e['heading'],
        categoryId: e['category_id'],
        brandId: e['subcategory_id'],
        title: e['heading'],
        sub_title: e['subheading'] ?? "",
        image: "$itemImgDir/${e['image'].split('.')[0]}/${e['image']}",
        price: double.parse(e['menu_price']),
        final_price: finalPrice(e),
        total_quantity: double.tryParse(e['quantity']) ?? 0,
        rating: double.parse(e['rating']),
        discount: double.tryParse(e['discount']) ?? 0,
        description: e['description'] ?? "",
        offerPeriod: e['offer_period'] ?? "",
        status: e['status'],
        isBestSeller: e['best_seller'] == "0" ? false : true,
        time: DateFormat('HH:mm:ss').parse(e['time']),
        date: DateTime.parse(e['date']));
  }

  static double finalPrice(Map<String, dynamic> e) {
    double? discount = double.tryParse(e['discount']);
    double? price = double.tryParse(e['menu_price']);
    double? finalPrice = double.tryParse(e['final_price']);

    if (finalPrice == null) {
      if (discount == null) {
        return double.parse(e['menu_price']);
      } else {
        double finalAmount = (price! * discount) / 100;
        return finalAmount;
      }
    }
    return finalPrice;
  }

//</editor-fold>
}
