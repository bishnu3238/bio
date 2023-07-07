import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/package/custom_widgets/custom_add_remove_button.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../class/model/cart/cart.dart';
import '../../../class/model/cart/cart_item.dart';
import '../../../package/animation/animation_switcher.dart';
import '../../../package/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cart}) : super(key: key);

  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    ItemModel item = ItemModel.fromCart(cart.toMap());
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ItemDetails(item: item))),
      child: Row(
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
                  style: stlL,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "$rupee ${cart.price}",
                    style: stl1(15, kDark, FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 10),
                CustomAddOrRemoveButtons(cart.id)
              ],
            ),
          )
        ],
      ),
    );
  }
}
