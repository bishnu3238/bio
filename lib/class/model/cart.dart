import 'package:flutter/material.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';

import 'cart_item.dart';

class Cart extends ChangeNotifier {
  List<CartItem> _cartItem = [];
  int _numOfItem = 0;

  List<CartItem> get cartItem => _cartItem;

  int get numOfItem => _numOfItem;

  set numOfItem(int value) {
    _numOfItem = value;
    notifyListeners();
  }

  set cartItem(List<CartItem> value) {
    _cartItem = value;
    notifyListeners();
  }

  addCartItem(ItemModel product, int quantity) {
    CartItem cartItem = CartItem.fromMap(product.toMap());
    var item = cartItem.copyWith(quantity: quantity);
    _cartItem.add(item);
    notifyListeners();
  }

  void removeAt(int index) {}
}
