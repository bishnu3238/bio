import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import 'package:universal_lab/screens/home_page/bottom_nav_bar/bottom_nav_bar.dart';
import '../../class/master.dart';
import '../../class/model/product_master/catergory_model.dart';
import '../../class/model/provider.dart';
import '../../class/widget_lavel_provider/sort_bar_notifier.dart';
import '../../package/custom_widgets/app_bars/app_bar.dart';
import '../../screens/home_page/sub_home_page/home/sub_home/sort_app_bar.dart';
import '../../class/model/product_master/items_model.dart';
import 'empty_items_page.dart';
import 'sub_items/item_page_body.dart';

class ItemsPage extends StatelessWidget {
  final String id;
  const ItemsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return Consumer<Provide>(
      builder: (context, provide, _) {
        CategoryModel category = provide.getCategoryFromId(id);
        List<ItemModel> items = provide.filterItems;
        return Scaffold(
          appBar: const AppAppBar(
            buttons: [UserIcon(isHome: false)],
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [const SortBar()];
            },
            body: items.isNotEmpty
                ? ItemPageBody(items: items)
                : const EmptyItemsPage(),
          ),
          // floatingActionButton: FloatingActionButton(
          //   elevation: 5,
          //   onPressed: () {},
          //   backgroundColor: Colors.lightBlueAccent.shade700,
          //   child: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          // ),
          bottomNavigationBar: const BottomNavBar(isHome: false),
        );
      },
    );
  }
}
