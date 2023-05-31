import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'size_config.dart';

TextStyle txStl(double? size, Color? color, FontWeight? fw) {
  return GoogleFonts.arya(fontSize: size, color: color, fontWeight: fw);
}

TextStyle txStlWithHt(double size, Color color, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fw, height: ht);
}

TextStyle navTxStl(double? size, Color? color, FontWeight? fw) {
  return GoogleFonts.notoSansCaucasianAlbanian(
      fontSize: size, color: color, fontWeight: fw);
}

TextStyle stl1(double? size, Color? color, FontWeight? fw) {
  return GoogleFonts.share(
      fontSize: size, color: color ?? Colors.blueGrey[900], fontWeight: fw);
}

TextStyle stlU(double? size, Color? color, FontWeight? fw) {
  return GoogleFonts.laila(
      fontSize: size,
      color: color ?? Colors.blueGrey.shade900,
      fontWeight: fw,
      decoration: TextDecoration.underline);
}

final stlH1 = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final stlH2 = GoogleFonts.ubuntuMono(
  fontSize: getProportionateScreenWidth(25),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  // height: 1.5,
);
final stlH3 = GoogleFonts.tiroTelugu(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final stlH4 = GoogleFonts.markoOne(
  fontSize: getProportionateScreenWidth(13),
  fontWeight: FontWeight.bold,
  color: Colors.deepOrangeAccent.shade700,
  height: 1.5,
);
final stlH5 = GoogleFonts.tiroTelugu(
  fontSize: getProportionateScreenWidth(10),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final stlH6 = GoogleFonts.tiroTelugu(
  fontSize: getProportionateScreenWidth(10),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final stlT = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

final stlL = GoogleFonts.joan(
  fontSize: 15.0,
  color: Colors.blueGrey[900],
  fontWeight: FontWeight.w600,
);
