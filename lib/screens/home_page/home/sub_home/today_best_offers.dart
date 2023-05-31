import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';

class TodayBestOffers extends StatelessWidget {
  const TodayBestOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(builder: (context, provide, _) {
      List<ItemModel> bestOffers = provide.getBestOffers();
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    child: GridTile(
                      footer: Card(
                        elevation: 0.5,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(bestOffers[index].name, overflow: TextOverflow.ellipsis,),
                                Text("${bestOffers[index].discount}% Off"),
                              ]),
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                             bestOffers[index].image,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: bestOffers.length > 6 ? 6 : bestOffers.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
        ),
      );
    });
  }
}
