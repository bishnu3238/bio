import 'brand_model.dart';

class CategoryModel {
  final String id;
  final String categoryName;
  final String image;
  final List<BrandModel>? brands;
  final List<CategoryModel>? subCategory;

//<editor-fold desc="Data Methods">
  const CategoryModel({
    required this.id,
    required this.categoryName,
    required this.image,
    this.brands,
    this.subCategory,
  });

  CategoryModel copyWith({
    String? id,
    String? categoryName,
    String? image,
    List<BrandModel>? brands,
    List<CategoryModel>? subCategory,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      image: image ?? this.image,
      brands: brands ?? this.brands,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
      'image': image,
      'brands': brands!.map((e) => e.toMap())
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      categoryName: map['categoryName'] as String,
      image: map['image'] as String,
      brands: [],
      subCategory: [],
    );





  }

//</editor-fold>
}
