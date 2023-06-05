import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../class/model/cart/cart.dart';
import '../../screens/cart/cart_screen.dart';
import '../navigate.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        return Badge(
          alignment: Alignment.topRight,
          backgroundColor: Colors.green[900],
          textStyle: stlH5,
          label: Text(
            "${cart.cartItem.length}",
            textAlign: TextAlign.center,
          ),
          offset: const Offset(-2, 2),
          isLabelVisible: cart.cartItem.isEmpty ? false : true,
          child: IconButton(
            onPressed: () {
              Navigate.go(context, const CartScreen());
            },
            icon: const FaIcon(Icons.shopping_cart_outlined),
          ),
        );
      },
    );
  }
}
