import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import 'cart_item.dart';

class Cart extends ChangeNotifier {
  List<CartItem> _cartItem = [];
  int _numOfItem = 0;

  static late BuildContext _context;
  static void initialize(BuildContext context) => _context = context;

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

  void removeAt(int index) {}

  bool isThisItemHave(String id){
     var item= _cartItem.where((element) => element.id == id).toList();
     return item.isNotEmpty;
  }

  void addToCart(ItemModel item) {
    CartItem cartItem = CartItem.fromMap(item.toMap())..quantity = 1;
    _cartItem.add(cartItem);
    notifyListeners();
  }

  CartItem? findItemById(String id) {
    CartItem? item;
    try {
      item = _cartItem.firstWhere((element) => element.id == id);
    } on StateError {
      item = null;
    }
    return item;
  }

  void incrementQuantity(String id) {
    _cartItem.firstWhere((element) => element.id == id).quantity++;
    notifyListeners();
  }

  void decrementQuantity(String id) {
    CartItem cartItem = _cartItem.firstWhere((element) => element.id == id);
    if (cartItem.quantity == 1) {
      removeFromCart(id);
    } else {
      cartItem.quantity--;
    }

    notifyListeners();
  }

  removeFromCart(String id) {
    CustomSnackBar.awesomeSnack(
        "Cart",
        "${_cartItem.firstWhere((element) => element.id == id).name} remove form cart",
        ContentType.warning);
    _cartItem.removeWhere((element) => element.id == id);

    notifyListeners();
  }
}
