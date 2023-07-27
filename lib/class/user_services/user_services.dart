import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:universal_lab/class/model/user/user_model.dart';

import '../../methods/getAddress.dart';
import '../model/user/user_address.dart';

class UserServices extends ChangeNotifier {
  List<Address> _address = [];

  List<Address> get address => _address;
  set address(List<Address> address) {
    _address = address;
    notifyListeners();
  }

  void addAddress(Address address) {
    _address.add(address);
    notifyListeners();
  }

  Future callAddressApi(context) async {
    log("callAddressApi");
    await getAddress(context);
  }

  Address addressFromId(String id) {
    Address add = _address.firstWhere((element) => element.id == id);
    return add;
  }

  void updateAddress(Address address) {
    int index = _address.indexWhere((element) => element.id == address.id);

    _address[index] = address;
    notifyListeners();
  }
}
