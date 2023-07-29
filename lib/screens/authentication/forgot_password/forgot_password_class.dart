import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordClass {
  final TextEditingController phone = TextEditingController();
  final password = TextEditingController();
  final bool isAbelToForgotPassword;
  final bool isLoading;
  ForgotPasswordClass(
      {this.isLoading = false, this.isAbelToForgotPassword = false});

  ForgotPasswordClass copyWith({
    bool? isLoading,
    bool? isAbelToForgotPassword,
  }) =>
      ForgotPasswordClass(
          isLoading: isLoading ?? this.isLoading,
          isAbelToForgotPassword:
              isAbelToForgotPassword ?? this.isAbelToForgotPassword);

  Future<bool> checkPhoneNoExistOrNot(String uri) async {
    copyWith(isLoading: true);
    Uri url = Uri.parse(uri);
    return await http.post(url, body: {"mobile": phone.text}).then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);

        if (result['success'] == true) {
          copyWith(isLoading: false, isAbelToForgotPassword: true);
          return true;
        } else {
          copyWith(isLoading: false, isAbelToForgotPassword: false);

          return false;
        }
      }
      copyWith(isLoading: false, isAbelToForgotPassword: false);
      return false;
    });
  }
}
