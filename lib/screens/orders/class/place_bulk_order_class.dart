import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../../../api/api_urls.dart';
import '../../../class/model/product_master/items_model.dart';
import '../../../class/model/user/user_model.dart';

class PlaceBulkOrderClass {
  final placeOrderKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final item = TextEditingController();
  final message = TextEditingController();

  void init(UserModel user, ItemModel itemModel) {
    name.text = user.name;
    phone.text = user.mobile_no;
    item.text = itemModel.name;
  }

  PlaceBulkOrderClass();

  Future submitBulkOrder() async {
    Uri url = Uri.parse(submitBulkOrderApi);

    try {
      return await http.post(url, body: {
        'name': name.text,
        'number': phone.text,
        'requested_items': item.text,
        'message': message.text,
        'email': ''
      }).then((value) {
        print(value.statusCode);
        print(value.body);
        var jsonData = jsonDecode(value.body);
        if (value.statusCode == 200 && jsonData['success'] == true) {
          clearTextFields();
          CustomSnackBar.showSnackBar(jsonData['message'], kSuccess);
          return jsonData['success'];
        } else {
          return false;
        }
      }).catchError((err) {
        CustomSnackBar.showSnackBar('Failed to submit, $err', kError);
        return false;
      });
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void clearTextFields() {
    name.clear();
    phone.clear();
    item.clear();
    message.clear();
  }

  void dispose() {
    name.dispose();
    phone.dispose();
    item.dispose();
    message.dispose();
  }
}
