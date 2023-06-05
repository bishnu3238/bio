import 'package:flutter/material.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';

import 'sub_cart/cart_body.dart';
import 'sub_cart/cart_check_out.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    BioCellar.initialize(context);
    return const Scaffold(
      appBar: AppAppBar(title: "Cart"),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
