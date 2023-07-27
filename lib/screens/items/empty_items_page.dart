import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

import '../../class/app_constant.dart';
import '../../package/text_style.dart';

class EmptyItemsPage extends StatelessWidget {
  const EmptyItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_items.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            Text('No Items', style: stl1(18, null, null)),
            const SizedBox(height: 16),
            Text("tap the button below to \nshop other items",
                textAlign: TextAlign.center, style: stl1(13, kGrey, null)),
            const SizedBox(height: 16),
            Buttons(
              text: "Continue Shopping",
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => const HomePage())),
            ),
            Text(appName, style: stlH3(Colors.white)),
          ],
        ),
      ),
    );
  }
}
