import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:universal_lab/api/api_urls.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/model/check_out_service/check_out_service.dart';
import 'package:universal_lab/class/model/product_master/shipping_model.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

import '../../../class/model/provider.dart';
import '../../../class/widget_lavel_provider/notifier.dart';
import '../../../package/custom_widgets/price_and_check_out_button.dart';
import '../../../package/text_style.dart';
import '../../intro/intro.dart';

List<Widget> checkOutFooter(BuildContext context) {
  Master.initialize(context);
  return [
    Consumer<CheckOutService>(
      builder: (context, checkOut, _) {
        return Consumer<Cart>(
          builder: (context, cart, _) {
            return Consumer<Notifier>(
              builder: (context, notify, _) {
                return notify.loading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Waiting", style: stlBtn()),
                              gap(10, 1),
                              LoadingAnimationWidget.bouncingBall(
                                  color: kOrange, size: 20)
                            ]),
                      )
                    : checkOut.progressIndex == 3
                        ? const DoneButton()
                        : PriceAndCheckOut(
                            cart.finalAmount,
                            color: kError.withOpacity(0.4),
                            buttonName: 'Continue',
                            width: 250,
                            callBack: () async {
                              // TODO: checking order process;
                              if (checkOut.progressIndex == 2) {
                                notify.loading = true;
                                await submitOrder(context, cart, checkOut)
                                    .then((value) {
                                  notify.loading = false;
                                  // notify.navIndex = 3;
                                }).catchError((err) {
                                  notify.loading = false;
                                });
                                return;
                              } else if (checkOut.progressIndex == 1) {
                                if (checkOut.paymentAddressId == '0' &&
                                    checkOut.deliveryAddressId == '0') {
                                  CustomSnackBar.showSnackBar(
                                      'Please select payment and shipping address',
                                      kError);
                                } else {
                                  checkOut.progressIndex = 2;
                                }
                              } else {
                                checkOut.progressIndex =
                                    (checkOut.progressIndex + 1) %
                                        CheckOutStages.values.length;
                              }
                            },
                          );
              },
            );
          },
        );
      },
    ),
  ];
}

class DoneButton extends StatelessWidget {
  const DoneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Phoenix.rebirth(context);
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> const Intro()), (route) => false);
        },
        child: Text(
          "Done",
          style: stlight.copyWith(
              fontWeight: FontWeight.w900, fontSize: 17, color: kD2Dark),
        ),
      ),
    );
  }
}

Future submitOrder(
    BuildContext context, Cart cart, CheckOutService checkOut) async {
  UserModel user = context.read<AuthService>().userModel;

  String invoice = DateTime.now().microsecondsSinceEpoch.toString();
  String invoiceId = "BIO$invoice";
  String ipAddress = '';
  List<ShippingModel> shippingCharges = context.read<Provide>().shippingCharges;

  await NetworkInterface.list()
      .then((value) => ipAddress = value.first.addresses.first.address);
  var order = cart.cartItem.map((e) => e.toMap()).toList();
  var orderDetails = jsonEncode(order);
  var shippingCharge = cart.getProductShippingCharge(
      shippingCharges, num.parse(cart.totalAmount));

  await Future.delayed(kDurationSCD(3));
  Map data = {
    'user_id': user.id,
    'shipping': shippingCharge.toString(),
    'add_mas_id': checkOut.paymentAddressId.toString(),
    'add_mas_id2': checkOut.deliveryAddressId.toString(),
    'invoice_id': invoiceId,
    'ip_addr': ipAddress,
    'total_qty': cart.cartItem.length.toString(),
    'total_price': cart.finalAmount,
    'orderdetails': orderDetails,
  };
  log(data.toString());

  Uri url = Uri.parse(submitOrderApi);
  log(url.toString());

  // Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoadingScreen()));
  await http.post(url, body: data).then((value) async {
    log(value.statusCode.toString());

    log('order submit details ${value.body}');

    if (value.statusCode == 200) {
      await cart.clearCart().then((value) {
        ++context.read<CheckOutService>().progressIndex;
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (ctx) => const HomePage()),
        //     (route) => false);
      });
    }
  }).catchError((ex) {
    log('error $ex');
  });
}
