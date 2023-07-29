import 'package:flutter/material.dart';
import '../../../../package/custom_widgets/app_bars/app_bar.dart';

import 'sub_settings/setting_page_body.dart';
import 'sub_settings/setting_page_header.dart';
import '../../../../class/master.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return Scaffold(
      appBar: AppAppBar(
          title: "ACCOUNT",
          icon: Icons.arrow_back,
          tPosition: false,
          todo: () => Navigator.pop(context)),
      body: const SingleChildScrollView(
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
