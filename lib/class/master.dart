import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/http_services.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../package/functions/user_pop_up.dart';
import '../search/search_filter_provider.dart';
import 'model/cart/cart.dart';

class Master {
  static late BuildContext _context;

  ThemeData get theme => Theme.of(_context);

  TextTheme? get txTheme => theme.textTheme;

  MediaQueryData get media => MediaQuery.of(_context);

  Size get size => media.size;
  EdgeInsets get padding => media.padding;

  Provide get provide => _context.read<Provide>();

  static void initialize(context) {
    _context = context;
    Cart.initialize(context);
    // Functions.initialize(context);
    AuthService.initialize(context);
    HttpServices.initialize(context);
    CustomSnackBar.initialize(context);
    SortBarNotifier.initialize(context);
    SearchFilterProvider.initialize(context);
  }
}
