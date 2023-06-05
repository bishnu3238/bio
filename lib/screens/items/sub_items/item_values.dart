import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';

import '../../../class/app_constant.dart';
import '../../../package/custom_widgets/custom_add_remove_button.dart';
import '../../../package/custom_widgets/custom_rating_bar.dart';
import '../../../package/text_style.dart';

class ItemValues extends StatelessWidget {
  final ItemModel item;
   final bool showAddToCart;
   const ItemValues(this.item,{Key? key,  this.showAddToCart = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            item.name,
            style: stl1(20, kDBlue, FontWeight.w100),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          const CustomRatingBar(3),
          const SizedBox(height: 10),
          Text(
            "\u{20B9} ${item.price.roundToDouble()}",
            style: stlH4,
          ),
          const SizedBox(height: 10),
          Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 10),
          showAddToCart
              ?  CustomAddOrRemoveButtons(item.id)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
