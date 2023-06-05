import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_lab/class/app_constant.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    primarySwatch: Colors.blue, // Color(0xFF2874F0),
    primaryColor: Colors.white,
    brightness: Brightness.light,
    drawerTheme: DrawerThemeData(
        elevation: 7.0,
        shape: Border.all(
            color: Colors.blueGrey.shade900,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside)),
    appBarTheme: AppBarTheme(
      elevation: 1.5,
      centerTitle: true,
      backgroundColor: Colors.blueGrey.shade700,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
      titleTextStyle: const TextStyle(color: Colors.black),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    // textTheme: TextTheme(
    //   titleLarge: GoogleFonts.montserrat(
    //     color: Colors.black87,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   titleSmall: GoogleFonts.poppins(
    //     color: Colors.black54,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   titleMedium: GoogleFonts.poppins(
    //     color: Colors.black54,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        .copyWith(background: Colors.redAccent.shade200),
  );

  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          backgroundColor: kDBlue,
          actionsIconTheme: IconThemeData(color: Colors.white)));
}
