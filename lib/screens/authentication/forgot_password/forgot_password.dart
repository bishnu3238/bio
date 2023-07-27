import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/screens/authentication/forgot_password/forgot_password_class.dart';

import '../../../class/app_constant.dart';
import '../../../package/loading_button.dart';
import '../log_in/login_body/phone_field.dart';
import '../sub_authentication/password_field_decoration.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ForgotPasswordClass _fpass = ForgotPasswordClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Enter your phone number"),
            PhoneField(
              phone: _fpass.phone,
              hint: 'Phone Number',
              onDone: (done) {},
              onCountryChange: (country) => log(country.name),
              onNumberChange: (number) => _fpass.phone.setText(number.number),
            ),
            if (_fpass.isAbelToForgotPassword) ...[
              TextFormField(
                obscureText: true,
                controller: _fpass.password,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                decoration: passwordDecoration(context),
              ),
              TextFormField(
                obscureText: true,
                controller: _fpass.password,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                decoration: passwordDecoration(context),
              )
            ],
            gap(50),
            LoadingButton(
                color: const Color(0xFF2874F0),
                text: 'Log In',
                onPressed: () => _forgotPassword()),
          ],
        ),
      ),
    );
  }

  Future _forgotPassword() async {
    // TODO: provide check phone no exist or not url;
    _fpass.checkPhoneNoExistOrNot('uri');
  }
}
