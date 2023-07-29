import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String hintText;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.decoration,
    this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: obscureText,
      onTap: onTap,
      readOnly: readOnly,
      cursorColor: Colors.blue,
      decoration: decoration ??
          InputDecoration(
            prefixIconConstraints: const BoxConstraints(
                maxHeight: 48, maxWidth: 48, minHeight: 10, minWidth: 15),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            hintText: hintText,
            prefixIcon: prefixIcon == null
                ? const SizedBox(width: 10, height: 10)
                : Icon(prefixIcon, color: Colors.blueGrey[800], size: 20),
            isDense: true,
            enabled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                // color: Theme.of(context).colorScheme.onPrimary,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
          ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
