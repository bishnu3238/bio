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

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Phoenix(
        child: const UniversalLab(),
      ),
    ),
  );
}

/// work to do,
/// submit rating and review,
/// forgot password,
/// point's management,
/// redeem points,
/// integrate payment gateway
///
