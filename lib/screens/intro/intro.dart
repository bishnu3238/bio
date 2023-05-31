import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/class/user/auth_service.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/screens/authentication/log_in.dart';
import '../../package/navigate.dart';

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
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<AuthService>(
        builder: (ctx, auth, _) {
          return StreamBuilder<User?>(
            stream: auth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return IntroBody(status: auth.load);
              } else if (snapshot.hasData) {
                if (snapshot.data == null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    auth.load = Load.Waiting.name;
                    Navigate.goto(context, const LogIn());
                  });
                  return IntroBody(status: auth.load);
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    auth.load = Load.Waiting.name;
                    Navigate.goto(context, const HomePage());
                  });
                  return IntroBody(status: auth.load);
                }
              } else {
                return IntroBody(status: auth.load);
              }
            },
          );
        },
      ),
    );
  }
}
