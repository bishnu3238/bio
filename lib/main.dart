import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import './screens/intro/universal_lab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'class/database/db.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DB.initHiveDatabase();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await  getItInitialize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Phoenix(
        child: const UniversalLab(),
      ),
    ),
  );
}

GetIt getIt = GetIt.instance;

Future <void> getItInitialize()async{




}