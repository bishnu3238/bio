import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/user/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';

import '../../class/model/cart.dart';
import '../../class/model/universal_lab_provider.dart';
import 'intro.dart';
import '../../package/app_theme.dart';

class UniversalLab extends StatelessWidget {
  const UniversalLab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Notifier()),
        ChangeNotifierProvider(create: (context) => Provide()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => Cart()),
        // ChangeNotifierProvider(create: (context) => PatientsProvider()),
      ],
      child: MaterialApp(
        title: 'Eazy Doctor',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const Intro(),
      ),
    );
  }
}
