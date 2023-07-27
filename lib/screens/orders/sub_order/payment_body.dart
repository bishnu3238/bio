import 'package:auto_size_text/auto_size_text.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/methods/static_methods.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalAmount = context.read<Cart>().finalAmount;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Rows(
            label: "Make Payment",
            widget: SizedBox(height: 50),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: AutoSizeText.rich(
                style: stlight,
                textAlign: TextAlign.start,
                TextSpan(text: "Please pay ", children: [
                  TextSpan(
                      style: stlight.copyWith(
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w800,
                          color: kPrimeColor),
                      text: convertAmountToWord(int.parse(totalAmount))),
                  const TextSpan(text: ' Via GPay '),
                  TextSpan(
                      text: gPayNumber,
                      style: stlH4.copyWith(fontWeight: FontWeight.w300)),
                  // const TextSpan(text: ' or '),
                  // TextSpan(
                  //     text: ' $gPayNumber2 - $gPayName2 ',
                  //     style: stlH4.copyWith(fontWeight: FontWeight.w300)),
                  const TextSpan(
                      text:
                          'and send the payment screenshot on our WhatsApp number. '),
                  TextSpan(
                      text: '12345667900.\n',
                      style: stlight.copyWith(
                          color: kError, fontWeight: FontWeight.w900)),
                  const TextSpan(
                      text:
                          'Customers are requested to mention their name while sending the screenshot.\n'),
                  TextSpan(text: 'Thank You', style: stlL)
                ])),
          ),
          gap(40),
          // SizedBox(
          //   width: double.maxFinite,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Buttons(
          //         color: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
          //             .inversePrimary,
          //         text: 'Pay via Google Pay',
          //         onTap: () async {
          //           await LaunchApp.isAppInstalled(
          //             androidPackageName:
          //                 'com.google.android.apps.walletnfcrel',
          //             // iosUrlScheme: 'pulsesecure://'
          //           );
          //
          //           // const String googlePayUrl =
          //           //     'com.google.android.apps.walletnfcrel';
          //           // bool isOpen = await canLaunchUrl(Uri.parse(googlePayUrl));
          //           //
          //           // if (isOpen ) {
          //           //   await launchUrl(Uri.parse(googlePayUrl));
          //           // } else {
          //           //   throw 'Could not open Google Pay';
          //           // }
          //         }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
