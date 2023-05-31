import 'package:flutter/material.dart';

InputDecoration customInputDecoration(
    {required BuildContext context,
    String? hint,
    String? label,
    Widget? prefix,
    Widget? suffix}) {
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
    border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
  );
}
