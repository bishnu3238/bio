import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({Key? key}) : super(key: key);

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
        Text(
          '+91 Phone Number',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        const SizedBox(height: 64)
      ],
    );
  }
}
