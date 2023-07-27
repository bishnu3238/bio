import 'package:flutter/material.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import '../../../package/custom_widgets/custom_rating_bar.dart';

class ItemRating extends StatelessWidget {
  final ItemModel item;
  const ItemRating({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomRatingBar(
        item,
        color: Colors.green[700],
        size: 16,
      ),
    );
  }
}
