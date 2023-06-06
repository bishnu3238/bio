import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../../../package/custom_widgets/custom_image.dart';
import '../../../../../package/navigate.dart';
import 'view_all_text.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        List<ItemModel> bestSeller = provide.getBestSeller();
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigate.go(
                          context, ItemDetails(item: bestSeller[index]));
                    },
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        CustomImage(
                          bestSeller[index].image,
                          height: 110,
                          radius: 8,
                        ),
                        ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(5, 0, 2, 10),
                          titleAlignment: ListTileTitleAlignment.top,
                          title: Text(
                            bestSeller[index].name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            bestSeller[index].description,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // TODO: remove textButton add row instead
                          trailing: TextButton.icon(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                            ),
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            label: const Text("4"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: bestSeller.length > 4 ? 4 : bestSeller.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 10,
          ),
        );
      },
    );
  }
}
