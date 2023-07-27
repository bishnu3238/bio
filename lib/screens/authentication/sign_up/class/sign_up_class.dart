import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:universal_lab/api/api_urls.dart';
import 'package:universal_lab/class/database/db.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../../../../class/app_constant.dart';
import '../../../../class/user_services/auth_service.dart';
import '../../../../class/widget_lavel_provider/notifier.dart';

class SignUp {
  AuthService auth = AuthService();

  final signUpFormKey = GlobalKey<FormState>();

  final name = TextEditingController();

  final phone = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final referCode = TextEditingController();

  disposeController() {
    name.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    referCode.dispose();
  }

  void clearController() {
    name.clear();
    phone.clear();
    email.clear();
    password.clear();
    referCode.clear();
  }

  signUp(Notifier notify, AuthService auth) async {
    Uri url = Uri.parse(signUpApi);
    log(url.toString());
    notify.loading = true;

    await http.post(url, body: {
      'name': name.text,
      'mobile': phone.text,
      'email': email.text,
      'password': password.text,
      'referal_code': referCode.text,
    }).then(
      (value) {
        log("${value.statusCode}");
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          log(jsonData.toString());
          if (jsonData['status'] == 400) {
            notify.loading = false;
            throw Exception(jsonData['message']);
          }

          // when signup successful
          auth.userModel = UserModel.fromMap(jsonData['data']);

          DB().storeUserDataIntoLocal(jsonEncode(auth.userModel.toMap()));

          auth.sendVerificationCode(phone.text);
        } else {
          throw HttpException(value.statusCode.toString());
        }
      },
    );
  }

  validateEmail(String value) {
    return value.isEmpty
        ? null
        : isEmailValid(value)
            ? null
            : kInvalidEmailError;
  }

  validatePhone(String value) {
    return value.length < 10 ? kPhoneNumberNullError : null;
  }

  validateName(String value) {
    return value.isEmpty ? kNameNullError : null;
  }

  void httpError(Object e) {
    CustomSnackBar.showSnackBar("$e", kDark, duration: kDurationSCD(3));
  }

// using value notifier;
// final _obscurePassword = ValueNotifier<bool>(true);
// ValueListenable<bool> get obscurePassword => _obscurePassword;
// void togglePasswordVisibility() {
//   _obscurePassword.value = !_obscurePassword.value;
// }
}
