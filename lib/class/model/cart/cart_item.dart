// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../product_master/items_model.dart';

class CartItem extends ItemModel {
  late int quantity;
  late int totalItemPrice;

  CartItem({
    required super.id,
    required super.name,
    required super.categoryId,
    required super.brandId,
    required super.title,
    required super.sub_title,
    required super.image,
    required super.price,
    required super.final_price,
    required super.total_quantity,
    required super.rating,
    required super.discount,
    required super.description,
    required super.offerPeriod,
    required super.status,
    required super.isBestSeller,
    required super.time,
    required super.date,
    super.subCategoryId,
    this.quantity = 0,
    this.totalItemPrice = 0,
  });

  @override
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
      'time': time.toString(),
      'date': date.toString(),
      'order_quantity': quantity,
      'total_item_price': totalItemPrice,
    };
  }

  // factory CartItem.fromMap(Map<String, dynamic>? map) {
  //   return CartItem(
  //     id: map == null ? "" : map['id'] as String,
  //     name: map == null ? "" : map['name'] as String,
  //     image: map == null ? "" : map['image'] as String,
  //     price: map == null ? 0.0 : map['price'] as double,
  //     rating: map == null ? 0.0 : map['rating'] as double,
  //     discount: map == null ? 0.0 : map['discount'] as double,
  //     description: map == null ? "" : map['description'] as String,
  //     brandId: map == null ? "" : map['brandId'] as String,
  //     categoryId: map == null ? "" : map['categoryId'] as String,
  //     subCategoryId: map == null ? "" : map['subCategoryId'] ?? "",
  //     quantity: map == null ? 0 : map['quantity'] ?? 0,
  //     isBestSeller: map == null ? false : map['isBestSeller'] as bool,
  //   );
  // }

  factory CartItem.fromMap(Map<String, dynamic>? map) {
    return CartItem(
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
      date: map == null ? DateTime.now() : map['date'],
      time: map == null ? TimeOfDay.now() : map['time'],
    );
  }
}
