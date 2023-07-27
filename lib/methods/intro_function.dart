import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/user_services.dart';
import '../class/model/http_services.dart';
import '../class/user_services/auth_service.dart';
import '../screens/home_page/home_page.dart';
import '../screens/intro/server_error.dart';

void introFunction(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 1),
    () async {
      await context
          .read<AuthService>()
          .authenticationStatus()
          .then((user) async {
        if (user != null) {
          await UserServices().callAddressApi(context);
        }
      },);

      await HttpServices().getCategory().then(
            (value) async => await HttpServices().getBrand().then(
                  (value) async => await HttpServices().getItem().then(
                        (value) => value
                            ? Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (route) => false)
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ServerError())),
                      ),
                ),
          );
    },
  );
}
