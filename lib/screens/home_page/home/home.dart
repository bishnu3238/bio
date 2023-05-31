import 'package:flutter/material.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'sub_home/our_products.dart';

import 'sub_home/today_best_offers.dart';
import 'sub_home/view_all_text.dart';
import '../../../package/custom_widgets/divide.dart';
import '../../../package/custom_widgets/image_sliders.dart';
import 'sub_home/brand_views.dart';
import 'sub_home/home_app_bar.dart';
import 'sub_home/best_seller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              ImageSlider(onTap: (value) {}),
              const BrandViews(),
              Divide(color: Colors.grey.shade200),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: ViewAllText(title: "Best Seller", viewAll: () {})),
        const BestSeller(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Divide(color: Colors.white24),
              ViewAllText(title: "Limited time offer %", viewAll: () {}),
            ],
          ),
        ),
        const TodayBestOffers(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Divide(color: Colors.grey[300]),
              ViewAllText(title: "Our products", viewAll: () {}),
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
