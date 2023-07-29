import 'dart:developer';
import 'package:flutter/foundation.dart' as f;
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/authentication/sign_up/class/sign_up_class.dart';
import 'package:universal_lab/screens/authentication/sign_up/sign_up.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

class Otp extends f.ChangeNotifier {
  final otp = TextEditingController();
  String _verificationId = '';

  int? _resendToken = 0;
  bool isLoading = false;

  @override
  String toString() {
    return "VID._ $_verificationId & RT._ $_resendToken";
  }

  void disposeController() {
    otp.dispose();
  }

  setCredential(verificationId,  [resendToken]) {
    _verificationId = verificationId;
    _resendToken = resendToken ?? _resendToken;
   }

  Future verifyOtp(context, AuthService auth) async {
    log("OTP: ${otp.text} VID: $_verificationId TOKEN: $_resendToken");
    AuthStatus status = await auth.verifyCode(_verificationId, otp.text);
    if (status == AuthStatus.Login) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const HomePage()),
      );
    }
  }

  resendOtp(AuthService auth, String phone, int? resendToken) async {
    // log("hello world $resendToken");
    log(phone);
    auth.resendOtp(phone, resendToken);
  }

  void verify(BuildContext context) async {
     var auth = context.read<AuthService>();
    if (otp.length < 6) {
      CustomSnackBar.showSnackBar("Enter Valid Verification Code", kError);
    } else {
      isLoading = true;
      notifyListeners();
      try {
        AuthStatus status = await auth.verifyCode(_verificationId, otp.text);
        if (status == AuthStatus.Login) {
          // TODO: store user data into server;
          await auth.signUp(signUpData).then((value) {
            if (value) {
              isLoading = false;
              notifyListeners();
              signUpData = SignUpData.empty;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => const HomePage()));
            } else {
              isLoading = false;
              notifyListeners();
              CustomSnackBar.showSnackBar(
                  'something went wrong, try again!', kError);
            }
          });
        }
      } catch (e) {
        otp.clear();
        isLoading = false;
        notifyListeners();
        CustomSnackBar.showSnackBar(e.toString(), kError);
        rethrow;
      }
    }
  }
}
