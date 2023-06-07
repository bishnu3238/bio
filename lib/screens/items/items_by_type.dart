import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import '../../class/model/universal_lab_provider.dart';
import '../../package/custom_widgets/app_bars/app_bar.dart';
import '../../package/navigate.dart';
import '../../package/size_config.dart';
import '../../class/enums.dart';
import '../../package/custom_widgets/custom_image.dart';
import '../../screens/home_page/sub_home_page/home/sub_home/sort_app_bar.dart';
import '../../class/model/product_master/items_model.dart';
import 'item_details/item_details.dart';
import 'sub_items/best_seller_tag.dart';
import 'sub_items/item_values.dart';
import 'sub_items/stack_icon.dart';

class ItemsByType extends StatelessWidget {
  final String? id;
  final ItemSearchType type;

  const ItemsByType({
    super.key,
    this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    BioCellar.initialize(context);
    return Consumer<Provide>(
      builder: (context, provide, _) {
        dynamic title = provide.groupedBy(type, id ?? "");
        List<ItemModel> items = provide.getItemsFromSearchType(type, id ?? "");
        return Scaffold(
          appBar: AppAppBar(title: title, tPosition: false),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
              return [const SortBar2()];
            },
            body: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigate.go(
                    context,
                    ItemDetails(item: items[index]),
                  ),
                  child: SizedBox(
                    height: getProportionateScreenWidth(275),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            _buildHero(items, index),
                            const StackIcon(),
                            items[index].isBestSeller
                                ? const BestSellerTag()
                                : const SizedBox(),
                          ],
                        ),
                        Expanded(
                          child: ItemValues(items[index], showAddToCart: true),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 5,
            onPressed: () {},
            backgroundColor: Colors.lightBlueAccent.shade700,
            child: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          ),
        );
      },
    );
  }

  Hero _buildHero(List<ItemModel> items, int index) {
    return Hero(
      tag: items[index].name,
      child: CustomImage(
        items[index].image,
        width: getProportionateScreenWidth(165),
        height: 270,
        fit: BoxFit.cover,
      ),
    );
  }
}
