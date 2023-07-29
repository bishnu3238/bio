import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import '../../class/model/provider.dart';
import '../../class/widget_lavel_provider/sort_bar_notifier.dart';
import '../../package/custom_widgets/app_bars/app_bar.dart';
import '../../package/size_config.dart';
import '../../class/enums.dart';
import '../../package/custom_widgets/custom_image.dart';
import '../../screens/home_page/sub_home_page/home/sub_home/sort_app_bar.dart';
import '../../class/model/product_master/items_model.dart';
import 'item_details/item_details.dart';
import 'sub_items/best_seller_tag.dart';
import 'sub_items/item_by_type_body.dart';
import 'sub_items/stack_icon.dart';

class ItemsBySorting extends StatefulWidget {
  static  String itemBySorting = '/itemBySorting';

  const ItemsBySorting({super.key});

  @override
  State<ItemsBySorting> createState() => _ItemsBySortingState();
}

class _ItemsBySortingState extends State<ItemsBySorting> {
  @override
  void initState() {
    super.initState();
    Master.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SortBarNotifier>(
      builder: (context, sortBar, _) {
        List<ItemModel> items = sortBar.filterItems;
        return Scaffold(
          appBar:  AppAppBar(
              icon: FontAwesomeIcons.angleLeft,
              todo:()=> Navigator.pop(context), buttons: const [UserIcon(isHome: false)],),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
              return [
                const SortBar2(),
              ];
            },
            body: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: getProportionateScreenWidth(275),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            _buildHero(items, index),
                            StackHeartIcon(
                              favoriteToggle: () {},
                            ),
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
