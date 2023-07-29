import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import '../../class/master.dart';
import '../../package/custom_widgets/app_bars/app_bar.dart';
import '../../package/custom_widgets/point_icon.dart';
import 'sub_cart/cart_body.dart';
import 'sub_cart/cart_check_out.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return const Scaffold(
      appBar: AppAppBar(title: "Cart", tPosition: false, buttons: [
        // PointIcon(),
        UserIcon(isHome: false)
      ]),
      body: CartBody(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
