import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../package/custom_widgets/custom_rating_bar.dart';
import '../../../../../package/text_style.dart';
import '../../../../../class/app_constant.dart';
import '../../../../../package/size_config.dart';
import '../../../../../class/model/provider.dart';
import '../../../../items/sub_items/item_price.dart';
import '../../settings/sub_settings/options_card.dart';
import '../../../../items/item_details/item_details.dart';
import '../../../../../package/custom_widgets/custom_image.dart';
import '../../../../../class/model/product_master/items_model.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            // height: getProportionateScreenHeight(250),
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
              itemBuilder: (BuildContext ctx, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ItemDetails(item: items[index]))),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!)),
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
                                    style: txStl(
                                            18, Colors.black87, FontWeight.w500)
                                        .copyWith(height: 1.15),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 2, 5, 2),
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
                                            provide
                                                .brand(items[index].brandId)
                                                .name,
                                            style: TextStyle(
                                                color: Colors.purple[800]),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ItemPrice(items: items[index], size: 15),
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
                          // StackHeartIcon(
                          //   favoriteToggle: () {},
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // ListView.separated(
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   itemCount: items.length > 10 ? 10 : items.length,
            //   itemBuilder: (ctx, ind) {
            //     return SizedBox(
            //       width: getProportionateScreenWidth(250),
            //       child: Card(
            //         child: InkWell(
            //           onTap: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (ctx) => ItemDetails(item: items[ind]))),
            //           child: Padding(
            //             padding: const EdgeInsets.all(5.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 CustomImage(
            //                   items[ind].image,
            //                   height: 150,
            //                   fit: BoxFit.cover,
            //                 ),
            //                 const SizedBox(height: 8),
            //                 Row(
            //                   children: [
            //                     Expanded(
            //                       flex: 2,
            //                       child: Text(items[ind].name,
            //                           style: stlH3(),
            //                           overflow: TextOverflow.ellipsis),
            //                     ),
            //                     Expanded(
            //                       child: Rows(
            //                         title: Row(crossAxisAlignment: CrossAxisAlignment.center,
            //                           children: [
            //                              FaIcon(
            //                               FontAwesomeIcons.solidStar,
            //                               size: 12,
            //                               color: Colors.yellow.shade800,
            //                             ),
            //                             const SizedBox(width: 8),
            //                             Text("${items[ind].rating}", style: txStl(15, kDBlue, FontWeight.normal),),
            //                           ],
            //                         ),
            //                         widget: const SizedBox(),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Text(
            //                   items[ind].sub_title,
            //                   style: stlL.copyWith(fontSize: 13, color: kGrey),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (con, index) => const Padding(
            //     padding: EdgeInsets.all(5),
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
