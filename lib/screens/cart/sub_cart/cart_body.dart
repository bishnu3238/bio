import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';

import '../../../class/model/cart/cart.dart';
import '../../../package/custom_widgets/empty_cart.dart';
import '../../../package/size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        return cart.cartItem.isEmpty
            ? const EmptyCart()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: ListView.builder(
                  itemCount: cart.cartItem.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CartCard(cart: cart.cartItem[index]),
                  ),
                ),
              );
      },
    );
  }
}
