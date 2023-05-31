import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../class/model/cart.dart';
import '../../../class/model/cart_item.dart';
import '../../../package/animation/animation_switcher.dart';
import '../../../package/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cart.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    splashRadius: 10.0,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      color: Color(0xFFEC6813),
                    ),
                  ),
                  Consumer(
                    builder: (ctx, data, _) {
                      return const AnimatedSwitcherWrapper(
                        child: Text(
                          "1",
                          //'{controller.cartProducts[index].quantity}',
                          // key: ValueKey<int>(
                          //   controller.cartProducts[index].quantity,
                          // ),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    splashRadius: 10.0,
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Color(0xFFEC6813)),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
