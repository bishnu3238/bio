import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/screens/authentication/log_in.dart';

import '../../package/loading_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final _phone = TextEditingController();
  final _referCode = TextEditingController();

  _signUp() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => LogIn())),
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 80.0),
                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),
                // CustomTextField(
                //   controller: _usernameController,
                //   hintText: 'Full Name',
                //   prefixIcon: FontAwesomeIcons.solidUser,
                //   onChanged: (name) {
                //     _patient.copyWith(pati_name: name);
                //   },
                // ),
                // const SizedBox(height: 20.0),
                // CustomTextField(
                //   controller: _phoneController,
                //   hintText: 'Phone No',
                //   prefixIcon: FontAwesomeIcons.mobile,
                //   onChanged: (phone) {
                //     _patient.copyWith(mobile: phone);
                //   },
                // ),
                // const SizedBox(height: 20.0),
                // CustomTextField(
                //   controller: _emailController,
                //   hintText: 'Email Id',
                //   prefixIcon: FontAwesomeIcons.solidEnvelope,
                //   onChanged: (email) {
                //     _patient.copyWith(email: email);
                //   },
                // ),
                const SizedBox(height: 20.0),
                LoadingButton(
                    text: "Sign Up",
                    color: Colors.blueGrey[800],
                    onPressed:
                      _signUp()
                    ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 2),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: ElevatedButton(
                //       onPressed: () {
                //         _signUp();
                //
                //         // Navigator.pushReplacement(
                //         //     context,
                //         //     MaterialPageRoute(
                //         //         builder: (ctx) => const OtpPage()));
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.symmetric(vertical: 13),
                //         backgroundColor: Colors.blueGrey.shade800,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //       ),
                //       child: const Text(
                //         'Sign Up',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (ctx) => LogIn())),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ? ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black)),
                        Text(
                          "Log In",
                          style: TextStyle(color: Colors.orange, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
