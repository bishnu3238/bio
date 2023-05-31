import 'package:flutter/material.dart';

abstract class AppConstant {
  static const String name = "Universal Lab";
  static const Color color = Color(0xFF2874F0);

  static const kPrimaryColor = Color(0xFFFF7643);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);

  static const kAnimationDuration = Duration(milliseconds: 200);

  static const defaultDuration = Duration(milliseconds: 250);

// Form Error
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";

  static const List<String> brandImages = [
    "aldrich.jpg",
    "dimond.jpg",
    "fluka.jpg",
    "himedia_logo.png",
    "microlit.jpg",
    "phonology.jpg",
    "sigma.jpg",
    "tarsons.jpg",
    "vaku-8.jpg",
  ];
  static const List<String> bannerImages = [
    "banner1.jpeg",
    "banner2.jpeg",
    "banner3.jpeg",
    "banner4.jpeg",
    "banner5.jpeg",
  ];
}
