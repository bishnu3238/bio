import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../class/app_constant.dart';
import 'dart:developer' as developer show log;

typedef IsDone = Future<dynamic> Function();

extension Log on String {
  void log() {
    developer.log(this);
  }
}

class LoadingScreen extends StatefulWidget {
  final IsDone? function;
  const LoadingScreen({Key? key, this.function}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    widget.function != null
        ? execute()
        : Future.delayed(kDurationSCD(1), () => Navigator.of(context).pop());
  }

  execute() async {
    await widget.function!().whenComplete(() {
      'api call complete'.log();
    }).then((value) {
      var result = value == null
          ? false
          : value is bool
              ? value
              : true;
      Future.delayed(kDurationSCD(2), () {
        if (result) {
          Navigator.of(context).pop();
        }
        Navigator.of(context).pop(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: getProportionateScreenWidth(375),
        height: getProportionateScreenHeight(812),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loadLoading(),
            const SizedBox(height: 15),
            Text("Please wait ...", style: stlBtn(kDBlue))
          ],
        ),
      ),
    );
  }
}

Card loadLoading() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: LoadingAnimationWidget.inkDrop(color: kDBlue, size: 30),
    ),
  );
}
