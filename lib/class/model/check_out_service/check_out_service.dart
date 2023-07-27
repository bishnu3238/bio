// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

enum CheckOutStages { Cart, Address, Payment, Summary }

class CheckOutService extends ChangeNotifier {
  int _progressIndex = 0;

  bool _isShippAddSameAsPaymentAddress = true;

  String _paymentAddressId = '0';

  String _deliveryAddressId = '0';

  bool get isShippAddSameAsPaymentAddress => _isShippAddSameAsPaymentAddress;

  set isShippAddSameAsPaymentAddress(bool tf) {
    _isShippAddSameAsPaymentAddress = tf;
    notifyListeners();
  }

  String get paymentAddressId => _paymentAddressId;

  set paymentAddressId(String id) {
    _paymentAddressId = id;
    notifyListeners();
  }

  int get progressIndex => _progressIndex;

  set progressIndex(int i) {
    _progressIndex = i;
    notifyListeners();
  }

  String get deliveryAddressId => _deliveryAddressId;

  set deliveryAddressId(String id) {
    _deliveryAddressId = id;
    notifyListeners();
  }
}
