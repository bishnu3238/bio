import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/size_config.dart';

import 'offer_card.dart';

class TodayBestOffers extends StatelessWidget {
  const TodayBestOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        List<ItemModel> bestOffers = provide.getBestOffers();
        var offerItems = bestOffers.length > 20
            ? bestOffers.getRange(0, 15).toList()
            : bestOffers;
        const divider = 2;
        return SizedBox(
          height: getProportionateScreenHeight(350),
          child: ListView.separated(
            physics:const  BouncingScrollPhysics(),
            itemCount: offerItems.length ~/ 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  OfferCard(
                      (offerItems.length ~/ 2) * 0 + index, offerItems[index]),
                  OfferCard(
                      (offerItems.length ~/ 2) * 1 + index, offerItems[index]),
                ],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
