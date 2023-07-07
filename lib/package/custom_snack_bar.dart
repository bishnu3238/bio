import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as t;
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/text_style.dart';

class CustomSnackBar {
  static late BuildContext _context;

  static void initialize(BuildContext context) {
    _context = context;
  }

  static void showSnackIsOnline(bool isOnline) {
    if (isOnline) {
      ScaffoldMessenger.of(_context).hideCurrentSnackBar();
      ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating, // set the behavior to floating
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'You are now online, "Server connected!"',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(_context).hideCurrentSnackBar();
      ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 8),
              Text('Server connection failed',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String massage,
    Color? color, {
    String? todo,
    Duration? duration,
    Function? onPressed,
  }) {
    ScaffoldMessenger.of(_context).hideCurrentSnackBar();

    return ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        elevation: 1,
        backgroundColor: color ?? Colors.green,
        duration: duration ?? kDurationSCD(2),
        content: Text(massage),
        action: SnackBarAction(
          label: todo ?? '',
          onPressed: () => onPressed!(),
          textColor: Colors.white,
        ),
      ),
    );
  }

  static void showToast(String message, Color color,
      [t.ToastGravity position = t.ToastGravity.CENTER]) {
    t.Fluttertoast.showToast(
        msg: message,
        toastLength: t.Toast.LENGTH_LONG,
        gravity: position,
        timeInSecForIosWeb: 20,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // static void awesomeSnack(String title, String message, ContentType type) {
  //   ScaffoldMessenger.of(_context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(
  //       SnackBar(
  //         elevation: 0,
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.transparent,
  //         content: AwesomeSnackbarContent(
  //           title: title,
  //           titleFontSize: 15,
  //           messageFontSize: 20,
  //           message: message,
  //           contentType: type,
  //         ),
  //       ),
  //     );
  // }

  static void showFlashToast(String message) {
    _context.showToast(
      Text(message), alignment: Alignment.center,
      shape: const StadiumBorder(),
      // queue: false,
      // alignment: const Alignment(0.0, -0.3),
    );
  }
}
