import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../package/functions/functions.dart';

class BioCellar {
  static void initialize(context) {
    Functions.initialize(context);
    AuthService.initialize(context);
    CustomSnackBar.initialize(context);
  }


}
