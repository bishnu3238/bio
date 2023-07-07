import 'package:flutter/foundation.dart';

import '../../app_constant.dart';
import 'items_model.dart';

List<BrandModel> brandsFromJson(dynamic jsonData) =>
    List<BrandModel>.from(jsonData['Data'].map((e) => BrandModel.fromMap(e)));

class BrandModel {
  final String id, name, image, status;

//<editor-fold desc="Data Methods">

  const BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
  });
  BrandModel copyWith({
    String? id,
    String? name,
    String? image,
    String? status,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'status': status,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as String,
      name: map['sub_category_name'] as String,
      image: "$brandImgDir/${map['image']}",
      status: map['status'] as String,
    );
  }


  //</editor-fold>

}
