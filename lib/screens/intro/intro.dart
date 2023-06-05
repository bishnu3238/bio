import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/screens/authentication/log_in.dart';
import '../../class/master.dart';
import '../../package/navigate.dart';

import '../../package/size_config.dart';
import '../home_page/home_page.dart';
import 'intro_body.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();

    context.read<Provide>().dummyData(); // TODO: remove this;
    BioCellar.initialize(context);

    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthService>().authStateChanges();
      Navigate.goto(context, const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // configure sizeConfig with device with, height

    return Scaffold(
      appBar: SimpleAppBar(
        color: const Color(0xFF2874F0),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2874F0), Colors.indigoAccent],
            ),
          ),
        ),
      ),
      body: const IntroBody(),
    );
  }
}
