import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/provider.dart';

import 'package:universal_lab/package/custom_widgets/custom_rating_bar.dart';

import 'package:universal_lab/package/text_style.dart';
import '../../../class/master.dart';
import '../../../class/model/product_master/items_model.dart';
import '../../../package/custom_widgets/custom_image.dart';
import '../../../package/size_config.dart';
import '../item_details/item_details.dart';
import 'item_price.dart';
import 'stack_icon.dart';

class ItemPageBody extends StatelessWidget {
  const ItemPageBody({super.key, required this.items});

  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    Provide provide = context.read<Provide>();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => ItemDetails(item: items[index]))),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey[400]!)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: items[index].name,
                              child: CustomImage(
                                items[index].image,
                                radius: 1,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 0),
                            AutoSizeText(
                              items[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                              style: txStl(18, Colors.black87, FontWeight.w500)
                                  .copyWith(height: 1.15),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                              decoration: BoxDecoration(
                                  color: Colors.purple[50],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.brandsFontAwesome,
                                    color: Colors.purple,
                                    size: 15,
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      provide.brand(items[index].brandId).name,
                                      style:
                                          TextStyle(color: Colors.purple[800]),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            ItemPrice(items: items[index], size: 10),
                            CustomRatingBar(
                              items[index],
                              color: Colors.greenAccent[700],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Shipping Charge",
                              style: stlH5.copyWith(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                    ),
                    StackHeartIcon(
                      favoriteToggle: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
