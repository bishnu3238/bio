import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

// TODO: work here later [07/06/2023]


class DB {
  static Future<Directory> getDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  static initHiveDatabase() async {
    var directory = await getDirectory();
    await Hive.initFlutter(directory.path);

    await Hive.openBox("User");
    await Hive.openBox("cart");
    await Hive.openBox("brand");
    await Hive.openBox("category");
  }
}
