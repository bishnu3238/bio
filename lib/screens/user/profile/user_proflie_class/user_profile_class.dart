import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../package/custom_snack_bar.dart';
import '../../../../api/api_urls.dart';
import '../../../../class/model/user/user_model.dart';
import 'package:provider/provider.dart';
import '../../../../class/user_services/auth_service.dart';

import 'package:http/http.dart' as http;

class UserProfileClass {
  UserProfileClass._init();

  static UserProfileClass initial = UserProfileClass._init();
  factory UserProfileClass() => initial;

  bool isImagePicked = false;
  final editProfileFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final gender = TextEditingController();
  final email = TextEditingController();
  dynamic image;

  final _readOnly = ValueNotifier<bool>(true);
  ValueNotifier<bool> get readOnly => _readOnly;

  toggleReadOnly() {
    readOnly.value = !readOnly.value;
  }

  void disposeController() {
    name.dispose();
    phone.dispose();
    gender.dispose();
    email.dispose();
  }

  void clearController() {
    name.clear();
    phone.clear();
    gender.clear();
    email.clear();
  }

  void initiateValues(UserModel user) {
    name.text = user.name;
    phone.text = user.mobile_no;
    gender.text = user.id; // add gender field;
    email.text = user.email!;
  }

  Future updateUserProfile(UserModel user, BuildContext context) async {
    Uri url = Uri.parse(updateUserProfileApi);
    CustomSnackBar.initialize(context);

    var request = http.MultipartRequest('POST', url)
      ..fields['name'] = name.text
      ..fields['email'] = email.text
      ..fields['user_id'] = user.id
      ..fields['password'] = user.password
      ..files.add(await http.MultipartFile.fromPath("image", image));

    try {
      await request.send().then((streamedResponse) {
        if (streamedResponse.statusCode == 200) {
          return streamedResponse.stream.bytesToString().then((value) {
            var result = jsonDecode(value);

            log("result: $result");

            var r = result['data'] is List ? result['data'][0] : result['data'];
            UserModel userModel = UserModel.fromMap(r);
            context.read<AuthService>().userModel = userModel;

            if (result["status"] == "200") {
              log("Update Doctor Successful");

              CustomSnackBar.showSnackBar("Update successful", Colors.green);
              return null;
            } else {
              CustomSnackBar.showSnackBar("Profile-Update-Failed", Colors.red);

              throw Exception("Profile-Update-Failed");
            }
          });
        } else {
          CustomSnackBar.showSnackBar(
              "Something-Went-Wrong : ${streamedResponse.statusCode}",
              Colors.red);

          throw Exception(
              "Something-Went-Wrong : ${streamedResponse.statusCode}");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
