import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../package/functions/functions.dart';
import '../search/search_filter_provider.dart';
import 'model/cart/cart.dart';

class BioCellar {
  static late BuildContext _context;

  ThemeData get theme => Theme.of(_context);

  TextTheme? get txTheme => theme.textTheme;

   MediaQueryData get media => MediaQuery.of(_context);

   Size get size => media.size;


  static void initialize(context) {
    _context = context;
    Cart.initialize(context);
    Functions.initialize(context);
    AuthService.initialize(context);
    CustomSnackBar.initialize(context);
    SearchFilterProvider.initialize(context);
  }
}
