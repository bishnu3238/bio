import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Notification", tPosition: false),
      body: Container(
        width: double.maxFinite,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FaIcon(
                FontAwesomeIcons.bell,
                size: 50,
              ),
            ),
            Text("No message avilable")
          ],
        ),
      ),
    );
  }
}
