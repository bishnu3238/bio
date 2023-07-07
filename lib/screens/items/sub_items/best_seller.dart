import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/empty_cart.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../package/custom_widgets/custom_image.dart';
import 'items_card.dart';

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
              return ItemsCard(item: bestSeller[index]);
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

