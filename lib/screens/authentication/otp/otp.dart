import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/package/loading_button.dart';
import 'package:universal_lab/screens/authentication/sign_up/sign_up.dart';
import '../../../class/model/user/user_model.dart';
import '../../../package/custom_widgets/app_bars/simple_app_bar.dart';
import 'otp_body/otp_header.dart';
import 'class/otp_class.dart';
import 'otp_body/resend_otp.dart';

class OtpPage extends StatefulWidget {
  final String vId;
  final int? rToken;
  const OtpPage(this.vId, this.rToken, {Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Otp otp = Otp();
  AuthService auth = AuthService();
  late UserModel user;

  @override
  void initState() {
    super.initState();
    otp.setCredential(widget.vId, widget.rToken);
    Master.initialize(context);
  }

  Future _verifyOtp() async {
    AuthService auth = context.read<AuthService>();
    try {
      await otp.verifyOtp(context, auth);
    } catch (e) {
      log(e.toString());
      CustomSnackBar.showSnackBar("Failed $e", Colors.red);
    }
  }

  @override
  void dispose() {
    super.dispose();
    otp.disposeController();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        return await auth
            .deleteUser()
            .whenComplete(() => Navigator.of(context).pop(true))
            .catchError((e) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => const SignupPage()));
        });
      },
      child: GestureDetector(
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
            child: Consumer<AuthService>(builder: (context, auth, _) {
              user = auth.userModel;
              return Column(
                children: [
                  OtpHeader(user.mobile_no),
                  Center(
                    child: Pinput(
                      length: 6,
                      autofocus: true,
                      onCompleted: (pin) => _verifyOtp(),
                      controller: otp.otp,
                      senderPhoneNumber: user.mobile_no,
                      onSubmitted: (pin) => _verifyOtp(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ResendOtp(user, resendToken: widget.rToken),
                  const Spacer(),
                  LoadingButton(
                    color: kDark,
                    text: "Verify",
                    onPressed: () => _verifyOtp(),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
