import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../class/model/cart/cart.dart';
import '../../../package/custom_widgets/empty_cart.dart';
import '../../../package/size_config.dart';
import 'cart_card.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        return cart.cartItem.isEmpty
            ? const EmptyCart()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
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
