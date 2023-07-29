import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/package/custom_widgets/divide.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import 'package:universal_lab/screens/items/empty_items_page.dart';
import '../../class/app_constant.dart';
import '../../class/model/provider.dart';
import '../../class/widget_lavel_provider/sort_bar_notifier.dart';
import '../../package/custom_widgets/app_bars/app_bar.dart';
import '../../package/size_config.dart';
import '../../class/enums.dart';
import '../../package/custom_widgets/custom_image.dart';
import '../../screens/home_page/sub_home_page/home/sub_home/sort_app_bar.dart';
import '../../class/model/product_master/items_model.dart';
import '../home_page/bottom_nav_bar/bottom_nav_bar.dart';
import 'item_details/item_details.dart';
import 'sub_items/best_seller_tag.dart';
import 'sub_items/item_by_type_body.dart';
import 'sub_items/stack_icon.dart';

class ItemsByType extends StatelessWidget {
  final String? id;
  final ItemSearchType type;

  const ItemsByType({super.key, this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return Consumer<Provide>(
      builder: (context, provide, _) {
        dynamic title = provide.groupedBy(type, id ?? "");
        // List<ItemModel> items = provide.itemsFromSearchType(type, id ?? "");
        // context.read<SortBarNotifier>().filteringItem = items;
        List<ItemModel> items = provide.filterItems;

        return Scaffold(
          appBar: AppAppBar(
            title: title,
            tPosition: false,
            buttons: const [  UserIcon(isHome: false)],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
              return [const SortBar2()];
            },
            body: items.isEmpty
                ? const EmptyItemsPage()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ItemDetails(item: items[index]),
                            )),
                        child: SizedBox(
                          height: getProportionateScreenWidth(280),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Container(color: kLight),
                                      ),
                                      _buildHero(items, index),
                                      StackHeartIcon(
                                        favoriteToggle: () {
                                          // user favorite items;
                                        },
                                      ),
                                      items[index].isBestSeller
                                          ? const BestSellerTag()
                                          : const SizedBox(),
                                    ],
                                  ),
                                  Expanded(
                                    child: ItemValues(items[index],
                                        showAddToCart: true),
                                  )
                                ],
                              ),
                              Divide(
                                  thick: 1,
                                  height: 1,
                                  color: kGrey.withOpacity(0.1))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          bottomNavigationBar: const BottomNavBar(isHome: false),
        );
      },
    );
  }

  Hero _buildHero(List<ItemModel> items, int index) {
    return Hero(
      tag: items[index].name,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: CustomImage(
          items[index].image,
          width: getProportionateScreenWidth(165),
          height: 270,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
