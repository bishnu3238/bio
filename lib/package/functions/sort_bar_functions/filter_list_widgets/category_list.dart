import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/product_master/catergory_model.dart';

import 'package:universal_lab/screens/items/items_by_type.dart';

import '../../../../class/model/provider.dart';
import '../../../../class/widget_lavel_provider/sort_bar_notifier.dart';

import '../../../text_style.dart';

class FilterCategoryList extends StatefulWidget {
  const FilterCategoryList({Key? key}) : super(key: key);

  @override
  State<FilterCategoryList> createState() => _FilterCategoryListState();
}

class _FilterCategoryListState extends State<FilterCategoryList> {
  List<CategoryModel> categorys = [];
  late final List<bool> values;
  @override
  void initState() {
    super.initState();
    categorys = context.read<Provide>().category;
    values = List.filled(categorys.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.grey[50],
      child: ListView.builder(
          itemCount: categorys.length,
          itemBuilder: (ctx, index) {
            var category = categorys[index];

            return ListTile(
              onTap: () {},
              shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              leading: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(category.image),
                ),
              ),
              title: Text(
                category.name,
                style: txStl(15, Colors.black87, FontWeight.w500),
              ),
              trailing:
                  Consumer<SortBarNotifier>(builder: (context, sortBar, _) {
                return Checkbox(
                    value: sortBar.selectedCategory[index],
                    onChanged: (value) => setState(
                        () => sortBar.selectedCategory[index] = value!));
              }),
            );
          }),
    );
  }

  _build(BuildContext ctx, int i, CategoryModel category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          ctx,MaterialPageRoute(builder: (ctx)=>
          ItemsByType(type: ItemSearchType.Category, id: category.id),)
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(category.image),
            // child: FadeInImage.assetNetwork(
            //   placeholder: "assets/logo/b.jpeg",
            //   image: 'https://picsum.photos/250?image=9',
            //   fit: BoxFit.cover,
            //   imageErrorBuilder: (ctx, obj, trash) {
            //     return const Text("BIOCELLAR");
            //   },
            // ),
          ),
          // Container(
          //   width: getProportionateScreenWidth(135),
          //   padding: const EdgeInsets.all(5.0),
          //   child:
          Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(category.name, overflow: TextOverflow.ellipsis),
            ],
            // ),
          )
        ],
      ),
    );
  }
}
