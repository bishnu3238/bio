import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './screens/intro/universal_lab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  try{
  WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);}catch(e){
    log(e.toString());
  }

  runApp(const UniversalLab());
}
