import 'dart:convert';
import 'dart:developer';
import 'package:provider/provider.dart' as p;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universal_lab/api/api_urls.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';

import '../../../../class/database/db.dart';
import '../../../home_page/home_page.dart';
import '../../forgot_password/forgot_password.dart';

class Login {
  final loginFormKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final password = TextEditingController();

  var passwordFocusNode = FocusNode();

  disposeController() {
    phone.dispose();
    password.dispose();
  }

  void clearController() {
    phone.clear();
    password.clear();
  }

  Future login(context, Notifier notify, AuthService auth) async {
    Uri url = Uri.parse(logInApi);
    notify.loading = true;
    return await http.post(
      url,
      body: {'mobile': phone.text, 'password': password.text},
    ).then(
      (value) {
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);

          log(jsonData.toString());

          if (jsonData['status'] == 400) throw Exception(jsonData['message']);
          if (jsonData['status'] == 403) throw Exception(jsonData['message']);

          UserModel user = auth.userModel = UserModel.fromMap(jsonData['data']);
          auth.authStatus = AuthStatus.Login;

          DB().storeUserDataIntoLocal(jsonEncode(user.toMap()));

          notify.loading = false;

          Navigator.of(context).pop();
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (ctx) => const HomePage()));
        } else {
          auth.authStatus = AuthStatus.Logout;
          notify.loading = false;
        }
      },
    );
  }

  void openForgot(BuildContext ctx) => Navigator.of(ctx)
      .push(MaterialPageRoute(builder: (ctx) => const ForgotPassword()));
}
