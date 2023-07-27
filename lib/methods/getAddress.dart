import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/user/user_address.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/user_services/user_services.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../api/api_urls.dart';
import '../class/widget_lavel_provider/notifier.dart';

Future<List<Address>?> getAddress(BuildContext context) async {
  UserModel user = context.read<AuthService>().userModel;
  CustomSnackBar.initialize(context);

  Uri url = Uri.parse(getUserAddresses);
  log(url.toString());

  try {
    await http.post(url, body: {'user_id': user.id}).then(
      (value) {
        if (value.statusCode == 200) {
          var data = jsonDecode(value.body);
          log(data.toString());
          List<Address> address = addressFormJson(data);
          log('get address successful');
          context.read<Notifier>().loading = false;
          return context.read<UserServices>().address = address;
        } else {
          context.read<Notifier>().loading = false;
        }
      },
    );
  } catch (e) {
    context.read<Notifier>().loading = false;
    log(e.toString());
    CustomSnackBar.showToast("something went wrong $e", kDark);
  }
  return null;
}
