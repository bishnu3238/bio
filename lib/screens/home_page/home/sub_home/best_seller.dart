import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/size_config.dart';

import 'view_all_text.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        List<ItemModel> bestSeller = provide.getBestSeller();
        return SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          bestSeller[index].image,
                          fit: BoxFit.fill,
                          height: getProportionateScreenHeight(100),
                          width: double.maxFinite,
                        )),
                    ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(8, 5, 2, 10),
                      title: Text(bestSeller[index].name,
                          overflow: TextOverflow.ellipsis),
                      subtitle: Text(bestSeller[index].description,
                          overflow: TextOverflow.ellipsis),
                      trailing: TextButton.icon(
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          ),
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.solidStar,
                            size: 15,
                            color: Colors.yellow,
                          ),
                          label: const Text("4")),
                    ),
                  ],
                ),
              ),
            );
          }, childCount: bestSeller.length > 4 ? 4 : bestSeller.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 8,
          ),
        );
      },
    );
  }
}
