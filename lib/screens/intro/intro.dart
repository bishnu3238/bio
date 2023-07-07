import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import '../../class/master.dart';
import '../../class/objects/network_services.dart';
import '../../methods/intro_function.dart';
import '../../package/size_config.dart';
import 'intro_body.dart';
import 'intro_error_body.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  bool introCalled = false;

  bool _hasInternetConnection = true;

  NetworkService network = NetworkService();

  @override
  void initState() {
    super.initState();
    Master.initialize(context);
    network.connectivityStreamController.stream.listen(
      (event) => setState(
        () => (_hasInternetConnection = (event != ConnectivityResult.none))
            ? introFunctions()
            : introError(),
      ),
    );
  }

  introFunctions() {
    !introCalled ? introFunction(context) : null;
    setState(() => introCalled = true);
  }

  introError() {
    setState(() => introCalled = false);
    CustomSnackBar.showSnackBar("you are offline", Colors.red);
  }

  @override
  void dispose() {
    super.dispose();
    network.disposeStream();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // configure sizeConfig with device with, height

    return Scaffold(
      appBar: _hasInternetConnection
          ? SimpleAppBar(
              color: kPrimeColor,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: kGradient([kPrimeColor, kIndigo]),
                ),
              ),
            )
          : const SimpleAppBar(),
      body: _hasInternetConnection ? const IntroBody() : const IntroErrorBody(),
    );
  }
}
