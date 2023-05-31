class ItemModel {
  final String id;
  final String name;
  final String image;
  final double price, rating, discount;
  final String description;
  final String brandId;
  final String categoryId;
  final String? subCategoryId;
  final bool isBestSeller;

//<editor-fold desc="Data Methods">
  const ItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.discount,
    required this.description,
    required this.brandId,
    required this.categoryId,
    this.subCategoryId,
    required this.isBestSeller,
  });

  ItemModel copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    double? rating,
    double? discount,
    String? description,
    String? brandId,
    String? categoryId,
    String? subCategoryId,
    bool? isBestSeller,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      discount: discount ?? this.discount,
      description: description ?? this.description,
      brandId: brandId ?? this.brandId,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      isBestSeller: isBestSeller ?? this.isBestSeller,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'rating': rating,
      'discount': discount,
      'description': description,
      'brandId': brandId,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'isBestSeller': isBestSeller,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      discount: map['discount'] as double,
      description: map['description'] as String,
      brandId: map['brandId'] as String,
      categoryId: map['categoryId'] as String,
      subCategoryId: map['subCategoryId'] as String,
      isBestSeller: map['isBestSeller'] as bool,
    );
  }

//</editor-fold>
}
