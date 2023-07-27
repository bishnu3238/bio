import 'dart:developer';

import 'package:flutter/material.dart';
import '../class/model/http_services.dart';

Future<bool> orderFunction(BuildContext context) async {
  HttpServices.initialize(context);
 return Future.delayed(
    const Duration(seconds: 1),
    () async {
      return await HttpServices().getUserOrders().then((value) async {
        log(value.toString());
        return true;
      });
    },
  );
}
