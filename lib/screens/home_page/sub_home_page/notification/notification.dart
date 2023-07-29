import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return Scaffold(
      appBar: const AppAppBar(
        title: "Messages",
        tPosition: false,
        buttons: [UserIcon(isHome: false)],
      ),
      body: FutureBuilder(
          future: Future.value(true),
          builder: (context, snapshot) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: FaIcon(FontAwesomeIcons.bell, size: 50)),
                  gap(10),
                  const Text("No message available")
                ],
              ),
            );
          }),
    );
  }
}
