import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/methods/cart_services.dart';
import 'package:universal_lab/package/loading_button.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../package/custom_widgets/price_and_check_out_button.dart';
import '../../../package/size_config.dart';
import 'cart_price_details.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart.initialize(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: kLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Consumer<Cart>(builder: (context, cart, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.read<Notifier>().showPriceDetails =
                    !context.read<Notifier>().showPriceDetails,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                          color: kLight2,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset("assets/images/empty_cart.png",
                          fit: BoxFit.fill),
                    ),
                    const Spacer(),
                    // GestureDetector(
                    //     onTap: () {
                    //       //TODO:
                    //     },
                    //     child: Text(
                    //       "Redeem Points",
                    //       style: stl1(13, kIndigo, null),
                    //     )),
                    // gap(10, 1),
                    Text("Price Details", style: stl1(13, null, null)),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward_ios, size: 12, color: kR400)
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              cart.cartItem.isEmpty
                  ? const SizedBox()
                  : CartPriceDetails(cart.cartItem),
              PriceAndCheckOut(
                cart.finalAmount,
                color: kPrimeColor,
                buttonName: 'Check Out',
                callBack:
                    cart.cartItem.isEmpty ? null : () => checkOut(context),
              ),
            ],
          );
        }),
      ),
    );
  }
}
