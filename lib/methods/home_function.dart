import 'package:flutter/material.dart';
import '../class/model/http_services.dart';

void homeFunction(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 1),
    () async {
      await HttpServices()
          .getMarquee()
          .then((_) async => await HttpServices().getShippingCharge());
    },
  );
}
