import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../class/model/check_out_service/check_out_service.dart';
import '../class/user_services/auth_service.dart';
import '../screens/authentication/log_in/log_in.dart';
import '../screens/orders/check_out_screen.dart';

Future checkOut(BuildContext ctx) async {
  bool isLogin = ctx.read<AuthService>().isUserAuthenticated();
  log(isLogin.toString());

  if (isLogin) {
    ctx.read<CheckOutService>().progressIndex =
        (CheckOutStages.values.indexOf(CheckOutStages.Cart));

    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(builder: (ctx) => const CheckOutScreen()),
    );
  } else {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }
}
