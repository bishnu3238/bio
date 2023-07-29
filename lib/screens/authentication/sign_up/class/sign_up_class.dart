import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart' as f;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:universal_lab/api/api_urls.dart';
import 'package:universal_lab/class/database/db.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/authentication/otp/otp.dart';

import '../../../../class/app_constant.dart';
import '../../../../class/user_services/auth_service.dart';
import '../../../../class/widget_lavel_provider/notifier.dart';
import '../sign_up.dart';

class SignUp extends f.ChangeNotifier {
  final signUpFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool showPassword = false;
  bool isPhoneNoExists = false;

  final name = TextEditingController();

  final phone = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final referCode = TextEditingController();

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

  void initController(SignUpData data) {
    name.text = data.name;
    phone.text = data.phone;
    email.text = data.email ?? "";
    password.text = data.password;
    referCode.text = data.referralCode ?? "";
  }

  Future checkPhoneNumber(String value) async {
    Uri url = Uri.parse(checkPhoneNumberExistOrNot);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'phone': phone.text});
    try {
      await http.post(url, body: body, headers: headers).then((value) {
        log(value.statusCode.toString());
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);
          log(result.toString());
          if (result['phoneExists']) {
            isPhoneNoExists = true;
            notifyListeners();

            CustomSnackBar.showToast(
              "Phone Number Exists With Another Account",
              kError,
            );
            return;
          }
          isPhoneNoExists = false;
          notifyListeners();
          return;
        } else {
          isPhoneNoExists = false;
          notifyListeners();
          throw HttpException(jsonDecode(value.body));
        }
      });
    } catch (e) {
      isPhoneNoExists = false;
      notifyListeners();
      throw HttpException(e.toString());
    }
  }

  sendCode(BuildContext context) async {
    var auth = context.read<AuthService>();

    if (signUpFormKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      if (isPhoneNoExists) {
        CustomSnackBar.showSnackBar(
          "This phone no already register with another account",
          kError,
        );
        isLoading = false;
        notifyListeners();
      } else {
        try {
          await auth.sendVerificationCode(phone.text, (id, token) {
            isLoading = false;
            notifyListeners();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => OtpPage(id, token),
              ),
            );
          });
        } catch (e) {
          isLoading = false;
          notifyListeners();
          CustomSnackBar.showSnackBar(e.toString(), kError);
        }
      }
    } else {
      isLoading = false;
      notifyListeners();
      CustomSnackBar.showSnackBar("Please fill the full form", kError);
    }
  }

  togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }
}

class SignUpData {
  final String name, phone, password;
  final String? email, referralCode;

  const SignUpData({
    required this.name,
    required this.phone,
    required this.password,
    this.email,
    this.referralCode,
  });
  static const empty = SignUpData(
      name: '', phone: '', password: '', email: '', referralCode: '');

  SignUpData copyWith({
    String? name,
    String? phone,
    String? password,
    String? email,
    String? referralCode,
  }) {
    return SignUpData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      email: email ?? this.email,
      referralCode: referralCode ?? this.referralCode,
    );
  }

  @override
  String toString() {
    return 'SignUpData{name: $name, phone: $phone, password: $password, email: $email, referralCode: $referralCode}';
  }
}
