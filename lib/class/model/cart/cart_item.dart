import 'package:flutter/material.dart';
import '../product_master/items_model.dart';

class CartItem extends ItemModel {

  late  int quantity;

//<editor-fold desc="Data Methods">
   CartItem({
    required id,
    required name,
    required image,
    required price,
    required rating,
    required discount,
    required description,
    required brandId,
    required categoryId,
    required subCategoryId,
     this.quantity = 0,
    required isBestSeller,
  }) : super(
            id: id,
            name: name,
            image: image,
            price: price,
            rating: rating,
            discount: discount,
            description: description,
            brandId: brandId,
            categoryId: categoryId,
            subCategoryId: subCategoryId,
            isBestSeller: isBestSeller);

  @override
  CartItem copyWith({
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
    int? quantity,
    bool? isBestSeller,
  }) {
    return CartItem(
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
      quantity: quantity ?? this.quantity,
      isBestSeller: isBestSeller ?? this.isBestSeller,
    );
  }

  @override
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
      'quantity': quantity,
      'isBestSeller': isBestSeller,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic>? map) {
    return CartItem(
      id: map == null ? "" : map['id'] as String,
      name: map == null ? "" : map['name'] as String,
      image: map == null ? "" : map['image'] as String,
      price: map == null ? 0.0 : map['price'] as double,
      rating: map == null ? 0.0 : map['rating'] as double,
      discount: map == null ? 0.0 : map['discount'] as double,
      description: map == null ? "" : map['description'] as String,
      brandId: map == null ? "" : map['brandId'] as String,
      categoryId: map == null ? "" : map['categoryId'] as String,
      subCategoryId: map == null ? "" : map['subCategoryId'] ?? "",
      quantity: map == null ? 0 : map['quantity'] ?? 0,
      isBestSeller: map == null ? false : map['isBestSeller'] as bool,
    );
  }

//</editor-fold>
}
