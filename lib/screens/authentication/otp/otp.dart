import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/package/custom_widgets/clear_focus.dart';
import 'package:universal_lab/screens/authentication/sign_up/sign_up.dart';
import '../../../package/custom_widgets/app_bars/simple_app_bar.dart';
import 'otp_body/otp_header.dart';
import 'class/otp_class.dart';
import 'otp_body/resend_otp.dart';

class OtpPage extends StatefulWidget {
  final String id;
  final int? token;
  const OtpPage(this.id, this.token, {Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Otp otp;

  @override
  void initState() {
    super.initState();
    otp = Otp();
    otp.setCredential(widget.id, widget.token);
    Master.initialize(context);
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return ClearFocus(
      child: ChangeNotifierProvider<Otp>.value(
        value: otp,
        child: Scaffold(
          appBar: _otpAppBar(theme),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
            child: Builder(
              builder: (context) {
                return Consumer<Otp>(
                  builder: (context, state, _) {
                    return Column(
                      children: [
                        OtpHeader(signUpData.phone),
                        Center(
                          child: Pinput(
                            length: 6,
                            autofocus: true,
                            controller: state.otp,
                            onCompleted: (pin) => state.verify(context),
                            senderPhoneNumber: signUpData.phone,
                            onSubmitted: (pin) => state.verify(context),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ResendOtp(signUpData, resendToken: widget.token),
                        const Spacer(),
                        BuildButton(
                          color: kDark,
                          isLoading: state.isLoading,
                          text: "Verify",
                          onPressed: () => state.verify(context),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  SimpleAppBar _otpAppBar(TextTheme theme) {
    return SimpleAppBar(
      icon: FontAwesomeIcons.arrowLeft,
      todo: () {}, // TODO: cross icon
      title: "OTP",
      color: const Color(0xFF2874F0),
      style: theme.titleMedium!.copyWith(
        color: Colors.white,
        letterSpacing: 0.8,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
