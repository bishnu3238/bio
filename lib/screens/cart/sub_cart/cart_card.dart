import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/package/custom_widgets/custom_add_remove_button.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';

import '../../../class/model/cart/cart.dart';
import '../../../class/model/cart/cart_item.dart';
import '../../../package/animation/animation_switcher.dart';
import '../../../package/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cart}) : super(key: key);

  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
                child: CustomImage(
                  cart.image,
                  radius: 10,
                )),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                cart.name,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                // maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$ ${cart.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.redAccent),
                ),
              ),
              const SizedBox(height: 10),
              CustomAddOrRemoveButtons(cart.id)
            ],
          ),
        )
      ],
    );
  }
}
