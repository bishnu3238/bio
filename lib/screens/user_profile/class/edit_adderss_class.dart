import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/user/user_address.dart';
import 'package:universal_lab/class/user_services/user_services.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../../../api/api_urls.dart';
import '../../../class/widget_lavel_provider/notifier.dart';
import '../../../methods/static_methods.dart';

class EditAddressClass {
  final editAddressFromKey = GlobalKey<FormState>();
  final pincode = TextEditingController();
  final address = TextEditingController();
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final landMark = TextEditingController();

  inti(Address add) {
    pincode.text = add.pincode_id;
    address.text = add.delivery_add;
    name.text = add.name;
    phoneNo.text = add.mobile_no;
    city.text = add.city;
    state.text = add.state;
    landMark.text = add.landmark ?? "";
  }

  dispose() {
    pincode.dispose();
    address.dispose();
    name.dispose();
    city.dispose();
    state.dispose();
    landMark.dispose();
    phoneNo.dispose();
  }

  clear() {
    pincode.clear();
    address.clear();
    name.clear();
    city.clear();
    state.clear();
    landMark.clear();
    phoneNo.clear();
  }

  @override
  String toString() {
    return "${name.text}:${phoneNo.text}:${pincode.text}:${address.text}:${city.text}:${state.text}:${landMark.text}:";
  }

  editAddress(Address address, BuildContext context) async {
    Map data = {
      'id': address.id,
      'name': name.text,
      'delivery_add': this.address.text,
      'landmark': landMark.text,
      'state': state.text,
      'city': city.text,
      'pincode_id': pincode.text,
      'location_id': "",
      'user_id': address.user_id,
      'mobile_no': phoneNo.text,
      'date': currentDate(),
      'time': currentTime()
    };

    CustomSnackBar.initialize(context);
    Uri url = Uri.parse(editAddressApi);

    log('$url');
    log("ID: ${address.id}, User_ID: ${address.user_id}");

    try {
      await http.post(url, body: data).then(
        (value) {
          if (value.statusCode == 200) {
            var jsonData = jsonDecode(value.body);
            log(jsonData.toString());
            Address address = Address.fromMap(jsonData['data']);
            context.read<UserServices>().updateAddress(address);
            CustomSnackBar.showSnackBar(jsonData['message'], kSuccess);

            context.read<Notifier>().loading = false;
          } else {
            context.read<Notifier>().loading = false;
          }
        },
      );
    } catch (e) {
      context.read<Notifier>().loading = false;
      log(e.toString());
      CustomSnackBar.showSnackBar("something went wrong $e", kError);
    }
  }
}
