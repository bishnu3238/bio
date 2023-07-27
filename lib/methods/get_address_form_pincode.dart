import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universal_lab/api/api_urls.dart';

Future getAddressFromPincode(BuildContext context, String pincode) async {
  Uri url = Uri.parse('$pincodeApi/$pincode');
  log(url.toString());
  try {
    return await http.get(url).then(
      (value) {
        log(value.statusCode.toString());
        if (value.statusCode == 200) {
          var data = value.body;
          Map<String, dynamic> jsonData = jsonDecode(data);
          log(jsonData.toString());

          return jsonData;
        }
      },
    );
  } catch (e) {
    rethrow;
  }
}
