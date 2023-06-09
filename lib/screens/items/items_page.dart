import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/catergory_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:group_grid_view/group_grid_view.dart';
import 'package:universal_lab/package/custom_widgets/divide.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../package/custom_widgets/custom_image.dart';
import '../../screens/home_page/sub_home_page/home/sub_home/sort_app_bar.dart';

import '../../class/model/product_master/items_model.dart';
import 'item_details/item_details.dart';
import 'sub_items/item_values.dart';
import 'sub_items/stack_icon.dart';

class ItemsPage extends StatelessWidget {
  final String id;
  const ItemsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        var theme = Theme.of(context).textTheme;
        CategoryModel category = provide.getCategoryFromId(id);
        List<ItemModel> items = provide.getItemsFromCategoryId(id);
        log(items.length.toString());
        return Scaffold(
          appBar: AppAppBar(title: category.name, tPosition: false),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [const SortBar()];
            },
            body: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () =>
                      Navigate.go(context, ItemDetails(item: items[index])),
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.blue.shade50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: items[index].name,
                                  child: CustomImage(
                                    items[index].image,
                                    radius: 10,
                                    height: 115,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(items[index].name,
                                    maxLines: 1,
                                    style: stlH3(),
                                    overflow: TextOverflow.fade),
                                Text(items[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                  "\u{20B9} ${items[index].price.roundToDouble()}",
                                  style: stlH4,
                                ),
                                const Text("Rating: 4.5")
                              ],
                            ),
                          ),
                          const StackIcon(),
                        ],
                      ),
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
}
