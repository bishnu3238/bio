import 'dart:developer';

import 'package:flutter/material.dart';
import '../class/model/http_services.dart';

void orderFunction(BuildContext context) {
  HttpServices.initialize(context);
  Future.delayed(
    const Duration(seconds: 1),
    () async {
      await HttpServices().getUserOrders().then((value) async {
        log(value.toString());
      });
    },
  );
}
