import 'package:flutter/material.dart';
import '../../../../package/custom_widgets/app_bars/app_bar.dart';

import 'sub_settings/setting_page_body.dart';
import 'sub_settings/setting_page_header.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(title: "ACCOUNT", tPosition: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SettingPageHeader(),
            SettingPageBody(),
          ],
        ),
      ),
    );
  }
}
