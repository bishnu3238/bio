import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

import '../otp.dart';

class Otp {
  final otp = TextEditingController();

  String _verificationId = '';
  int? _resendToken = 0;

  @override
  String toString() {
    return "VID._ $_verificationId & RT._ $_resendToken";
  }

  void disposeController() {
    otp.dispose();
  }

  setCredential(verificationId, [resendToken]) {
    _verificationId = verificationId;
    _resendToken = resendToken ?? _resendToken;
  }

  void thisPage(context, String verificationId, int resendToken) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OtpPage(verificationId, resendToken)));
  }

  Future verifyOtp(context, AuthService auth) async {
    log("OTP: ${otp.text} VID: $_verificationId TOKEN: $_resendToken");
    AuthStatus status = await auth.verifyCode(_verificationId, otp.text);
    if(status == AuthStatus.Login){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> const HomePage()));
    }
  }

  resendOtp(AuthService auth, String phone, int? resendToken) async {
    // log("hello world $resendToken");
    log(phone);
    auth.resendOtp(phone, resendToken);
  }
}
