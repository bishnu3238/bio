import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/custom_widgets/divide.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

class OurProducts extends StatelessWidget {
  const OurProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(builder: (context, provide, _) {
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
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              items[ind].image,
                              fit: BoxFit.fill,
                              // width: getProportionateScreenWidth(200),
                              // height: getProportionateScreenHeight(120),
                            ),
                          ),

                          ///
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(items[ind].name,
                                    style: stlH3,
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
                );
              },
              separatorBuilder: (con, index) =>
                  const Padding(padding: EdgeInsets.all(5))),
        ),
      );
    });

    // SliverGrid(
    //   delegate: SliverChildBuilderDelegate((context, index) {
    //     return Stack(
    //       fit: StackFit.expand,
    //       children: [
    //         GridTile(
    //           footer: const Card(
    //             margin: EdgeInsets.zero,
    //             child: Padding(
    //               padding: EdgeInsets.all(3.0),
    //               child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text("item name"),
    //                     Text("Item Description"),
    //                   ]),
    //             ),
    //           ),
    //           child: Column(
    //             children: [
    //               Image.asset(
    //                 "assets/images/aldrich.jpg",
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     );
    //   }, childCount: 6),
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5));
  }
}
