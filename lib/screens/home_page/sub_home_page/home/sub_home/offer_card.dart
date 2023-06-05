import 'package:flutter/material.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../../../class/model/product_master/items_model.dart';
import '../../../../../package/size_config.dart';

class OfferCard extends StatelessWidget {
  final int index;
  final ItemModel bestOffers;
  const OfferCard(this.index, this.bestOffers, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      elevation: 2,
      shadowColor: Colors.greenAccent[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: () {
          Navigate.go(context, ItemDetails(item: bestOffers));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(125),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/logo/b.jpeg",
                  image: 'https://picsum.photos/250?image=9',
                  fit: BoxFit.cover,
                  imageErrorBuilder: (ctx, obj, trash) {
                    return const Text("BIOCELLAR");
                  },
                ),
              ),
            ),
            Container(
              width: getProportionateScreenWidth(135),
              padding: const EdgeInsets.all(5.0),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(bestOffers.name, overflow: TextOverflow.ellipsis),
                  Text("${bestOffers.discount}% Off"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
