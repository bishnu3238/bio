import 'package:flutter/foundation.dart';

import 'items_model.dart';

class BrandModel {
  final String id;
  final String name;
  final String image;
  // final List<ItemModel>? items;

//<editor-fold desc="Data Methods">
  const BrandModel({
    required this.id,
    required this.name,
    required this.image,
    // this.items,
  });

  BrandModel copyWith({
    String? id,
    String? name,
    String? image,
    // List<ItemModel>? items,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      // items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      // 'items': items!.map((e) => e.toMap())
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as String,
      name: map['brandName'] as String,
      image: map['image'] as String,
      // items: [],
    );
  }



//</editor-fold>
}
