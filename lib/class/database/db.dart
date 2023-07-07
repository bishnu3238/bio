import 'dart:developer';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// TODO: work here later [07/06/2023]

enum StoreKey {
  user,
}

class DB {
  static Future<Directory> getDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  static initHiveDatabase() async {
    var directory = await getDirectory();

    await Hive.initFlutter(directory.path);

    await Hive.openBox("user");
    await Hive.openBox("brand");
    await Hive.openBox("category");
    await Hive.openBox("cartItems");
  }

  void storeUserDataIntoLocal(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(StoreKey.user.name, data);
  }

  void removeUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(StoreKey.user.name);
  }

  Future<String?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? data = sharedPreferences.getString(StoreKey.user.name);
    return data;
  }
}
