import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../../../package/custom_widgets/custom_image.dart';

class OurProducts extends StatelessWidget {
  const OurProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        List<ItemModel> items = provide.items;
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: SizedBox(
            height: getProportionateScreenHeight(250),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: items.length > 10 ? 10 : items.length,
              itemBuilder: (ctx, ind) {
                return SizedBox(
                  width: getProportionateScreenWidth(250),
                  child: Card(
                    child: InkWell(
                      onTap: () =>
                          Navigate.go(context, ItemDetails(item: items[ind])),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomImage(
                              items[ind].image,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(items[ind].name,
                                      style: stlH3(),
                                      overflow: TextOverflow.ellipsis),
                                ),
                                TextButton.icon(
                                    style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.zero),
                                    ),
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      size: 15,
                                      color: Colors.yellow,
                                    ),
                                    label: const Text("4")),
                              ],
                            ),
                            Row(
                              children: [
                                Text(items[ind].description,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (con, index) => const Padding(
                padding: EdgeInsets.all(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
