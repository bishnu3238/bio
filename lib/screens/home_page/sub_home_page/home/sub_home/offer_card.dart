import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../../../class/model/product_master/items_model.dart';
import '../../../../../package/custom_widgets/custom_image.dart';
import '../../../../../package/size_config.dart';

class OfferCard extends StatelessWidget {
  final ItemModel item;
  const OfferCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      elevation: 2,
      shadowColor: Colors.greenAccent[100],
      shape: kRoundRadius(5),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => ItemDetails(item: item)));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            gap(5),
            CustomImage(
              item.image,
              height: 125,
              width: 120,
            ),
            Container(
              width: getProportionateScreenWidth(135),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: kGrey.withOpacity(0.1),
                boxShadow: [
                  BoxShadow(color: kOrange.withOpacity(0.1)),
                  BoxShadow(color: kR400.withOpacity(0.1))
                ],
              ),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    style: stlight.copyWith(
                        color: kD2Dark, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "${item.discount}% Off",
                    style: stlight.copyWith(
                        color: kR400, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
