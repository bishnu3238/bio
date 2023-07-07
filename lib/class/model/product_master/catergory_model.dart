

import 'package:universal_lab/class/app_constant.dart';

import 'brand_model.dart';

List<CategoryModel> categoriesFromJson(dynamic jsonData) =>
    List<CategoryModel>.from(
        jsonData['Data'].map((e) => CategoryModel.fromMap(e)));

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String status;
  // final List<BrandModel>? brands;
  // final List<CategoryModel>? subCategory;

//<editor-fold desc="Data Methods">
  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    // this.brands,
    // this.subCategory,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
    String? status,
    // List<BrandModel>? brands,
    // List<CategoryModel>? subCategory,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      // brands: brands ?? this.brands,
      // subCategory: subCategory ?? this.subCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'status': status,
      // 'brands': brands!.map((e) => e.toMap())
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'].toString(),
      name: map['category_name'].toString(),
      image: "$categoryImgDir/${map['image']}",
      status: map['status'].toString(),

      // brands: [],
      // subCategory: [],
    );
  }

//</editor-fold>
}
