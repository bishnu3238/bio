import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

import '../../../class/model/http_services.dart';
import '../../../package/text_style.dart';
import '../all_item_details.dart';

class ItemReviews extends StatefulWidget {
  final ItemModel item;
  const ItemReviews({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemReviews> createState() => _ItemReviewsState();
}

class _ItemReviewsState extends State<ItemReviews> {
  late StreamSubscription reviewSubscription;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpServices().getMoreProductDetails(widget.item),
      builder: (context, snapshot) {
        List reviews;
        if (snapshot.hasData && snapshot.data != null) {
          if ((snapshot.data!['reviews'] as List).isNotEmpty) {
            reviews = snapshot.data!['reviews'];
            return SizedBox(
              height: getProportionateScreenHeight(
                  reviews.length == 1 ? 150 : reviews.length * 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Rows(
                      label: "User Reviews",
                      widget: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => AllItemReviews(
                                          reviews: reviews,
                                        )));
                          },
                          child: Text(
                            'view all',
                            style: stlU(11, kSuccess, FontWeight.w600),
                          ))),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reviews.length > 2 ? 2 : reviews.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: Border(
                                bottom:
                                    BorderSide(color: kGrey.withOpacity(0.05))),
                            title: Text(reviews[index]['name']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(reviews[index]['review'],
                                    maxLines: 2),
                                const SizedBox(height: 10),
                                Text("Rating: ${reviews[index]['rating']}")
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        }
        return Container();
      },
    );
  }
}
