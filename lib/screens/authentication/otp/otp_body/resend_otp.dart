import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';

import '../../../../class/widget_lavel_provider/notifier.dart';
import '../class/otp_class.dart';

class ResendOtp extends StatefulWidget {
  final UserModel user;
  final int? resendToken;

  const ResendOtp(this.user, {Key? key, this.resendToken}) : super(key: key);

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  late Timer _timer;
  int _resendTimer = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer == 0) {
        timer.cancel();
        context.read<Notifier>().loading = false;
      } else {
        setState(() => _resendTimer--);
      }
    });
  }

  stopTimer() {
    _timer.cancel();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  resendOtp() {
    var auth = context.read<AuthService>();
    setState(() => _resendTimer = 60);
    startTimer();
    context.read<Notifier>().loading = true;
    try {
      Otp().resendOtp(auth, widget.user.mobile_no, widget.resendToken);
    } catch (e) {
      context.read<Notifier>().loading = false;

      log("Stop Timer");
      log(e.toString());
      stopTimer();
      log("stop Timer");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        Text(
          'Did\'t receive the OTP?',
          style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        ),
        _resendTimer == 0
            ? TextButton(
                onPressed: () => resendOtp(),
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
    );
  }
}
