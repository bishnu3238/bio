import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './screens/intro/universal_lab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const UniversalLab());
}
