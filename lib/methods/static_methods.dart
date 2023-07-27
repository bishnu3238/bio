import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:universal_lab/class/model/user/user_model.dart';

import '../class/enums.dart';

String formatAmount(num amount) {
  final format = NumberFormat('#,##,###.00');
  return format.format(amount);
}

String showUserTitle(User user) {
  if (user.name.isNotEmpty) {
    return user.name;
  } else if (user.phoneNO.isNotEmpty) {
    return user.phoneNO;
  } else if (user.email.isNotEmpty) {
    return user.email;
  } else {
    return user.uid;
  }
}

String textCapitalize(String input) {
  String text = input.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]} ${m[2]}');
  return text;
}

String getSortOptionText(SortOptions sortOption) {
  switch (sortOption) {
    case SortOptions.BestSeller:
      return 'Best Seller';
    case SortOptions.PriceLowToHigh:
      return 'Price - Low to High';
    case SortOptions.PriceHighToLow:
      return 'Price - High to Low';
    case SortOptions.Discount:
      return 'Discount';
    case SortOptions.AZ:
      return 'A-Z';
    case SortOptions.ZA:
      return 'Z-A';
    default:
      return '';
  }
}

convertImageUt8(String imgPath) {
  var uint8 = rootBundle.load(imgPath).then((value) =>
      value.buffer.asUint8List(value.offsetInBytes, value.lengthInBytes));
  return uint8;
}

String currentDate() {
  DateTime dateTime = DateTime.now();

  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  return formattedDateTime;
}

String currentTime() {
  DateTime dateTime = DateTime.now();

  String formattedTime = DateFormat('hh:mm:ss a').format(dateTime);
  return formattedTime;
}

DateTime convertTime(String time) {
  DateTime dateTime;

  try {
    dateTime = DateTime.parse(time);
    return dateTime;
  } catch (e) {
    List<String> formats = [
      'hh:mm:ss a',
      'HH:mm:ss',
      'yyyy-MM-dd HH:mm:ss.SSS'
    ];
    for (String format in formats) {
      DateFormat formatter = DateFormat(format);
      dateTime = formatter.parse(time);
      return dateTime;
    }

    throw const FormatException('Invalid time format');
  }
}

DateTime convertDate(String date) {
  return DateTime.parse(date);
}

String removeCountryCode(String phoneNumber) {
  final countryCodeRegex = RegExp(r'^\+\d+\s');
  return phoneNumber.replaceAll(countryCodeRegex, '');
}

convertAmountToWord(int amount) {
  // Convert the amount to words using the NumberFormat class
  NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'en_IN');
  String amountInWords = formatter.format(amount);
  return amountInWords;

  log(amountInWords);
}
