import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/user/user_address.dart';
import 'package:universal_lab/class/user_services/user_services.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../api/api_urls.dart';
import '../class/widget_lavel_provider/notifier.dart';

Future saveAddress(BuildContext context, Map<dynamic, dynamic> data) async {
  CustomSnackBar.initialize(context);
  Uri url = Uri.parse(saveAddressApi);

  log('$url');

  try {
    await http.post(url, body: data).then(
      (value) {
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          log(jsonData.toString());
          Address address = Address.fromMap(jsonData['data']);
          context.read<UserServices>().addAddress(address);
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
