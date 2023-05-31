import 'package:flutter/foundation.dart';

import 'items_model.dart';

class BrandModel {
  final String id;
  final String brandName;
  final String image;
  final List<ItemModel>? items;

//<editor-fold desc="Data Methods">
  const BrandModel({
    required this.id,
    required this.brandName,
    required this.image,
    this.items,
  });

  BrandModel copyWith({
    String? id,
    String? brandName,
    String? image,
    List<ItemModel>? items,
  }) {
    return BrandModel(
      id: id ?? this.id,
      brandName: brandName ?? this.brandName,
      image: image ?? this.image,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brandName': brandName,
      'image': image,
      'items': items!.map((e) => e.toMap())
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as String,
      brandName: map['brandName'] as String,
      image: map['image'] as String,
      items: [],
    );
  }



//</editor-fold>
}
