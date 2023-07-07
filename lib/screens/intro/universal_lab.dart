import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../class/model/check_out_service/check_out_service.dart';
import '../../screens/items/item_by_sorting.dart';
import '../../class/user_services/auth_service.dart';
import '../../class/user_services/user_services.dart';
import '../../class/widget_lavel_provider/notifier.dart';

import '../../class/model/cart/cart.dart';
import '../../class/model/provider.dart';
import 'intro.dart';
import '../../package/app_theme.dart';
import '../../class/widget_lavel_provider/sort_bar_notifier.dart';

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
        ChangeNotifierProvider(create: (context) => UserServices()),
        ChangeNotifierProvider(create: (context) => SortBarNotifier()),
        ChangeNotifierProvider(create: (context) => CheckOutService()),
      ],
      child: MaterialApp(
        title: 'Eazy Doctor',
        theme: AppTheme.light,
        // darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const Intro(),
      ),
    );
  }
}
