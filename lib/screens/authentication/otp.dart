import 'dart:async';
import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/package/loading_button.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

import '../../class/widget_lavel_provider/notifier.dart';
import '../../package/custom_widgets/app_bars/app_bar.dart';
import '../../package/custom_widgets/app_bars/simple_app_bar.dart';
import 'sub_authentication/otp_header.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  final String? verificationId;
  final int? resentToken;
  const OtpPage(this.phoneNumber, this.verificationId, this.resentToken,
      {Key? key})
      : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _timer;
  int _resendTimer = 60;
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    startTimer();
    AuthService.initialize(context);
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer == 0) {
        timer.cancel();
      } else {
        setState(() {
          _resendTimer--;
        });
      }
    });
  }

  stopTimer() {
    _timer.cancel();
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future _verify(
    TextEditingController otpController,
  ) async {
    try {
      BioCellar.initialize(context);
      await authService
          .verifyCode(widget.verificationId!, otpController.text)
          .then((value) {
        value.user != null
            ? CustomSnackBar.awesomeSnack(
                "Success!", "Login Successful", ContentType.success)
            : CustomSnackBar.showSnackBar("Verification Failed", Colors.red);
        Navigate.goto(context, const HomePage());
      });
    } catch (e) {
      context.read<Notifier>().loading = false;

      log(e.toString());
      CustomSnackBar.showSnackBar("Verification Failed $e", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Consumer<AuthService>(
      builder: (context, auth, _) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Scaffold(
            appBar: SimpleAppBar(
                icon: FontAwesomeIcons.arrowLeft,
                todo: () {}, // TODO: cross icon
                title: "OTP",
                color: const Color(0xFF2874F0),
                style: theme.titleMedium!.copyWith(
                    color: Colors.white,
                    letterSpacing: 0.8,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
              child: Column(
                children: [
                  OtpHeader(widget.phoneNumber),
                  Center(
                    child: Pinput(
                      length: 6,
                      controller: auth.otpController,
                      senderPhoneNumber: widget.phoneNumber,
                      onSubmitted: (pin) {
                        // Do something with the OTP
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Spacer(),
                      Text(
                        'Did\'t receive the OTP?',
                        style:
                            TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                      ),
                      _resendTimer == 0
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  _resendTimer = 60;
                                });
                                startTimer();
                                // TODO: Handle resend OTP logic
                                try {
                                  auth.resendOtp("9231665466", () {}, true);
                                } catch (e) {
                                  log("Stop Timer");
                                  stopTimer();
                                  log("stop Timer");
                                }
                              },
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          : Text(
                              ' $_resendTimer seconds',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                    ],
                  ),
                  const Spacer(),
                  LoadingButton(
                    color: kBlue,
                    text: "Verify",
                    onPressed: () => _verify(auth.otpController),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
