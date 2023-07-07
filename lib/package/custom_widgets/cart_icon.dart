import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../class/model/cart/cart.dart';
import '../../screens/cart/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        return FittedBox(

          child: Badge(
            alignment: Alignment.topRight,
            smallSize: 12, largeSize: 14,
            backgroundColor: kSuccess,
            textStyle: stlH5.copyWith(fontSize: 10),
            label: Text(
              "${cart.cartItem.length}",
              textAlign: TextAlign.center,
            ),
            offset: const Offset(-2, 4),
            isLabelVisible: cart.cartItem.isEmpty ? false : true,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartScreen()));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: getProportionateScreenWidth(25),
              ),
            ),
          ),
        );
      },
    );
  }
}
