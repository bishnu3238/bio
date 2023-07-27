import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/screens/items/sub_items/items_card.dart';

import '../../../package/size_config.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';

class ViewSimilar extends StatelessWidget {
  final ItemModel itemModel;
  const ViewSimilar({Key? key, required this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemModel> similarItems = context
        .read<Provide>()
        .items
        .where((element) => element.categoryId == itemModel.categoryId)
        .skipWhile((value) => value.id == itemModel.id)
        .toList();

    return Column(
      children: [
        const SizedBox(height: 5),
        Rows(
          title: Text(
            "View Similar",
            style: stlight.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          widget: const SizedBox(),
        ),

        // const Rows(label: "View Similar"),
        const SizedBox(height: 10),
        Container(
          height: getProportionateScreenHeight(235),
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: similarItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return SizedBox(
                width: getProportionateScreenWidth(160),
                child: ItemsCard(item: similarItems[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
