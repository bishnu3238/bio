import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../class/model/cart.dart';
import '../../screens/cart/cart_screen.dart';
import '../navigate.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Consumer<Cart>(
      builder: (context, cart, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Badge(
            alignment: Alignment.topCenter,
            label: Text("${cart.cartItem.length}"),
            isLabelVisible: cart.cartItem.isEmpty ? false : true,
            child: IconButton(
                onPressed: () {
                  Navigate.go(context, const CartScreen());
                },
                icon: const FaIcon(Icons.shopping_cart_outlined)),
          ),
        );
      },
    )
    ;
  }
}
