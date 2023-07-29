import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/screens/authentication/sign_up/sign_up.dart';

extension PhoneNumberHide on String {
  String get phoneNumberHide {
    if (length == 0) return "";
    final maskedLength = length - 2;
    final maskedCharacters = 'x' * maskedLength;
    final maskedPhoneNo = replaceRange(1, maskedLength, maskedCharacters);
    return maskedPhoneNo;
  }
}

class OtpHeader extends StatelessWidget {
  final String phoneNO;
  const OtpHeader(this.phoneNO, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Text(
          'Verification',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Enter the code sent to the number',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color.fromRGBO(133, 153, 170, 1),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              phoneNO.phoneNumberHide,
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                color: const Color.fromRGBO(100, 60, 87, 100),
              ),
            ),
            gap(10, 1),
            InkWell(
              onTap: () {


                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const SignupPage()));
              },
              child: Text(
                "Edit",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 20, color: kR400),
              ),
            )
          ],
        ),
        const SizedBox(height: 64)
      ],
    );
  }
}
