import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    Function? onPressed,
    int? duration,
    double? radius,
  }) {
    ScaffoldMessenger.of(_context).hideCurrentSnackBar();

    return ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        elevation: 3,
        width: double.maxFinite,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(8.0),
        backgroundColor: color ?? Colors.green,
        duration: Duration(milliseconds: duration ?? 4000),
        content: SizedBox(
            width: double.maxFinite, child: Text(massage, style: stlH3)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          side: BorderSide(color: Colors.brown.shade900),
        ),
        action: SnackBarAction(
          label: todo ?? '',
          onPressed: () => onPressed!(),
          textColor: Colors.white,
        ),
      ),
    );
  }

  static void showToast(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 20,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void awesomeSnack(String title, String message, ContentType type) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: type,
          ),
        ),
      );
  }
}
