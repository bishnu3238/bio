import 'brand_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  // final List<BrandModel>? brands;
  // final List<CategoryModel>? subCategory;

//<editor-fold desc="Data Methods">
  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    // this.brands,
    // this.subCategory,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
    // List<BrandModel>? brands,
    // List<CategoryModel>? subCategory,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name:name ?? this.name,
      image: image ?? this.image,
      // brands: brands ?? this.brands,
      // subCategory: subCategory ?? this.subCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      // 'brands': brands!.map((e) => e.toMap())
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['categoryName'] as String,
      image: map['image'] as String,
      // brands: [],
      // subCategory: [],
    );





  }

//</editor-fold>
}
