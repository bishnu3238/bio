import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:universal_lab/class/app_constant.dart';

class PhoneField extends StatelessWidget {
  final String hint;
  final Function(PhoneNumber)? onNumberChange;
  final Function(Country)? onCountryChange;
  final Function(String)? onDone;

  final TextEditingController phone;

  const PhoneField({
    Key? key,
    required this.phone,
    required this.hint,
     this.onNumberChange,
    this.onCountryChange,
    this.onDone
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return IntlPhoneField(
      enabled: true,
      controller: phone,
      showCountryFlag: false,
      initialCountryCode: "IN",
      cursorColor: Colors.blue.shade700,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      decoration: InputDecoration(
        enabled: true,
        isDense: true,
        labelText: hint,
        border: const OutlineInputBorder(),
        labelStyle: theme.titleSmall!.copyWith(color: kDBlue),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimeColor),
        ),
      ),
      onChanged: (number) => onNumberChange!(number),
      onCountryChanged: (cty) => onCountryChange!(cty),
      onSubmitted: (done)=>onDone!(done),
    );
  }
}
