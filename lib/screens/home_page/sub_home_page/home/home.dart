import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';
import 'package:universal_lab/screens/items/items_by_type.dart';
import '../../../../package/navigate.dart';
import 'sub_home/our_products.dart';

import 'sub_home/today_best_offers.dart';
import 'sub_home/view_all_text.dart';
import '../../../../package/custom_widgets/divide.dart';
import '../../../../package/custom_widgets/image_sliders.dart';
import 'sub_home/brand_views.dart';
import 'sub_home/home_app_bar.dart';
import 'sub_home/best_seller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BioCellar.initialize(context);
    return CustomScrollView(
      slivers: [
        HomeAppBar(
          onSearch: (data) {
            if (data.type == ItemSearchType.Item) {
              ItemModel item = context.read<Provide>().getItemFromId(data.id);
              Navigate.go(context, ItemDetails(item: item));
            } else {
              Navigate.go(context, ItemsByType(type: data.type!, id: data.id));
            }
          },
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              ImageSlider(onTap: (value) {
                // TODO: imageSlider Link
              }),
              const BrandViews(),
              Divide(color: Colors.grey.shade200),
              ViewAllText(
                  title: "Best Seller",
                  viewAll: () => Navigate.go(context,
                      const ItemsByType(type: ItemSearchType.Bestseller)))
            ],
          ),
        ),
        const BestSeller(),
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divide(color: Colors.white24),
              ViewAllText(
                  title: "Limited time offer %",
                  viewAll: () => Navigate.go(context,
                      const ItemsByType(type: ItemSearchType.Discount))),
              const TodayBestOffers(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Divide(color: Colors.grey[300]),
              ViewAllText(
                  title: "Our products",
                  viewAll: () => Navigate.go(
                      context, const ItemsByType(type: ItemSearchType.Item))),
              const OurProducts(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Card(child: Divide(color: Colors.amber[100])),
              Container(
                color: Colors.grey[100],
                width: double.infinity,
                height: getProportionateScreenHeight(150),
                child: Center(
                  child: Text(
                    "Universal Lab apk  0.0.1",
                    style: stlH6,
                  ),
                ),
              )
            ],
          ),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     childCount: 200,
        //     (context, index) {
        //       return Card(
        //         child: ExpansionTile(
        //           title: Text("Category $index"),
        //           trailing: const FaIcon(FontAwesomeIcons.angleDown,
        //               color: Colors.black, size: 15),
        //         ),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}
