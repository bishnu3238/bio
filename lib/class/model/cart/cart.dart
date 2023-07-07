import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/methods/static_methods.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import '../product_master/shipping_model.dart';
import '../provider.dart';
import 'cart_item.dart';

class Cart extends ChangeNotifier {
  List<CartItem> _cartItem = [];
  int _numOfItem = 0;

  static late BuildContext _context;
  static void initialize(BuildContext context) => _context = context;

  List<CartItem> get cartItem => _cartItem;

  int get numOfItem => _numOfItem;

  String get totalItemPrice {
    var amount = formatAmount(_cartItem.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.price)));

    return amount;
  }

  String get totalAmount {
    int price = _cartItem.isEmpty
        ? 0
        : int.parse(totalItemPrice.replaceAll(',', '').split('.')[0]);
    int discount = _cartItem.isEmpty
        ? 0
        : int.parse(totalItemDiscount.replaceAll(',', '').split('.')[0]);
    int total = price - discount;
    return total.toString();
  }

  String get finalAmount {
    List<ShippingModel> shippingCharges =
        _context.read<Provide>().shippingCharges;
    int total = _cartItem.isEmpty
        ? 0
        : int.parse(totalAmount) +
            int.parse(getProductShippingCharge(
                shippingCharges, int.parse(totalAmount)));
    return total.toString();
  }

  String get totalItemDiscount {
    var amount = _cartItem.isEmpty
        ? "0"
        : formatAmount(_cartItem.fold(
            0, (sum, item) => sum + (item.price * (item.discount / 100))));

    return amount;
  }

  Box<dynamic>? _cartBox; // Hive box for storing the Cart object

  Future<void> initHive() async {
    _cartBox = Hive.box('cart');
    if (_cartBox!.containsKey('cart')) {
      final dynamic cartData = CartItem.fromMap(_cartBox!.get('cart'));
      _cartItem = cartData;
    }
  }

  void saveCartToHive() async {
    _cartBox = Hive.box("cart");
    _cartBox!.put('cart', _cartItem);
    log(_cartBox!.values.toString());
  }

  set numOfItem(int value) {
    _numOfItem = value;
    notifyListeners();
  }

  set cartItem(List<CartItem> value) {
    _cartItem = value;
    notifyListeners();
  }

  void removeAt(int index) {}

  bool isThisItemHave(String id) {
    var item = _cartItem.where((element) => element.id == id).toList();
    return item.isNotEmpty;
  }

  void addToCart(ItemModel item, BuildContext context) {
    CustomSnackBar.initialize(context);
    var data = _cartItem.where((element) => element.id == item.id).toList();
    if (data.isNotEmpty) {
      CustomSnackBar.showSnackBar(
          "Already added to cart".toUpperCase(), kSuccess);
      return;
    }
    CartItem cartItem = CartItem.fromMap(item.toMap())..quantity = 1;
    cartItem.totalItemPrice =
        (cartItem.quantity * cartItem.final_price).toInt();
    _cartItem.add(cartItem);
    CustomSnackBar.showSnackBar(
        "${cartItem.name} added to cart".toUpperCase(), kSuccess);
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
    _cartItem.firstWhere((element) => element.id == id).totalItemPrice =
        (_cartItem.firstWhere((element) => element.id == id).quantity *
                _cartItem.firstWhere((element) => element.id == id).final_price)
            .toInt();

    log(_cartItem.firstWhere((element) => element.id == id).toMap().toString());

    notifyListeners();
  }

  void decrementQuantity(String id) {
    CartItem cartItem = _cartItem.firstWhere((element) => element.id == id);
    if (cartItem.quantity == 1) {
      removeFromCart(id);
    } else {
      cartItem.quantity--;
      cartItem.totalItemPrice =
          (cartItem.quantity * cartItem.final_price).toInt();
      log(cartItem.toMap().toString());
    }

    notifyListeners();
  }

  removeFromCart(String id) {
    CartItem cartItem = _cartItem.firstWhere((element) => element.id == id);

    _cartItem.remove(cartItem);
    saveCartToHive();

    CustomSnackBar.showSnackBar(
       "${cartItem.name} remove form cart", kError);

    notifyListeners();
  }

  String getProductShippingCharge(
      List<ShippingModel> shippingCharges, num productPrice) {
    for (var shipping in shippingCharges) {
      if (productPrice >= shipping.min && productPrice <= shipping.max) {
        return shipping.charges.toString();
      }
    }
    // Return a default charge if no matching shipping charge is found
    return "0";
  }

  Future clearCart() async {
    Future.delayed(
        kDurationSCD(),
        () => CustomSnackBar.showSnackBar(
            "Order submit successful, please wait until we verify", kSuccess));
    _cartItem = [];
    notifyListeners();
  }
}
