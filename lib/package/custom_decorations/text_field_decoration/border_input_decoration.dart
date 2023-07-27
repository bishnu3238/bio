import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/screens/authentication/sign_up/class/sign_up_class.dart';

InputDecoration borderInputDecoration({
  required BuildContext context,
  String? hint,
  String? label,
  Widget? prefix,
  Widget? suffix,
  double? radius = 12,
  Color? borderColor = kDBlue,
}) {
  return InputDecoration(
    alignLabelWithHint: true,
    prefixIconConstraints: const BoxConstraints(
        maxWidth: 150, maxHeight: 50, minWidth: 38, minHeight: 38),
    prefixIcon: prefix,
    suffixIcon: suffix,
    hintStyle: Theme.of(context).textTheme.bodySmall,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: label,
    hintText: hint,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kDBlue),
        borderRadius: BorderRadius.circular(radius!)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor!),
        borderRadius: BorderRadius.circular(radius)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
  );
}
