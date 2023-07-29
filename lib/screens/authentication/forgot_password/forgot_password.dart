import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        backgroundColor: kLight,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: kDBlue),
        ),
        title: Image.asset(appLogo, width: 100, height: 35),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kPrimeColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "Forget Password",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(color: kDark, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 20),
              Text(
                "Enter your phone number that you used to register your account.",
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleLarge!
                    .copyWith(color: kGrey),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: PhoneField(
                  phone: _fpass.phone,
                  hint: 'Phone Number',
                  onDone: (done) {},
                  onCountryChange: (country) => log(country.name),
                  onNumberChange: (number) =>
                      _fpass.phone.setText(number.number),
                ),
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
                  text: 'Continue',
                  onPressed: () => _forgotPassword()),
            ],
          ),
        ),
      ),
    );
  }

  Future _forgotPassword() async {
    // TODO: provide check phone no exist or not url;
    _fpass.checkPhoneNoExistOrNot('uri');
  }
}
