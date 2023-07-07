import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'log_in_header.dart';
import 'log_out_header.dart';

class SettingPageHeader extends StatelessWidget {
  const SettingPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (ctx, auth, _) {
      log(auth.authStatus.name);
      return Container(
        child: auth.authStatus == AuthStatus.Login
            ? const LogInHeader()
            : const LogOutHeader(),
      );
    });
  }
}
