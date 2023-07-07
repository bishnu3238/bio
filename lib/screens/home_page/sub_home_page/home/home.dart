import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/items_by_type.dart';
import 'sub_home/our_products.dart';
import 'sub_home/show_marquee.dart';
import 'sub_home/today_best_offers.dart';
import 'sub_home/view_all_text.dart';
import '../../../../package/custom_widgets/divide.dart';
import '../../../../package/custom_widgets/image_sliders.dart';
import '../../../../class/app_constant.dart';
import 'sub_home/brand_views.dart';
import 'sub_home/home_app_bar.dart';
import '../../../items/sub_items/best_seller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("home.dart");
    Master.initialize(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              ImageSliders(onTap: (value) {
                // TODO: imageSlider Link
              }),
              const BrandViews(),
              Divide(color: Colors.grey.shade200),
              ViewAllText(
                title: "Best Seller",
                viewAll: () {
                  context
                      .read<Provide>()
                      .itemsFromSearchType(ItemSearchType.Bestseller, "");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ItemsByType(
                              type: ItemSearchType.Bestseller)));
                },
              )
            ],
          ),
        ),
        const BestSeller(),
        SliverToBoxAdapter(
          child: Container(
            // decoration: BoxDecoration(color: kPrimeColor.withOpacity(0.6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const ShowMarquee(),
                // const Divide(color: Colors.white24),
                ViewAllText(
                  title: "Limited time offer %",
                  viewAll: () {
                    context
                        .read<Provide>()
                        .itemsFromSearchType(ItemSearchType.Discount, "");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ItemsByType(
                                type: ItemSearchType.Discount)));
                  },
                ),
                const TodayBestOffers(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Divide(color: Colors.grey[300]),
              ViewAllText(
                title: "Our products",
                viewAll: () {
                  context
                      .read<Provide>()
                      .itemsFromSearchType(ItemSearchType.Item, "");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ItemsByType(type: ItemSearchType.Item)));
                },
              ),
              const OurProducts(),
            ],
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Column(
        //     children: [
        //       Card(child: Divide(color: Colors.amber[100])),
        //       Container(
        //         color: Colors.grey[100],
        //         width: double.infinity,
        //         height: getProportionateScreenHeight(150),
        //         child: Center(
        //           child: Text(
        //             "",
        //             // "BioCellar Lab apk  0.0.1",
        //             style: stlH6,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
