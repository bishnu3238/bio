import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/product_master/brand_model.dart';
import 'package:universal_lab/class/model/product_master/catergory_model.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/screens/items/items_by_type.dart';

import '../../../../class/model/provider.dart';
import '../../../../screens/items/item_details/item_details.dart';
import '../../../../screens/items/items_page.dart';
import '../../../size_config.dart';
import '../../../text_style.dart';

class FilterBrandList extends StatefulWidget {
  const FilterBrandList({Key? key}) : super(key: key);

  @override
  State<FilterBrandList> createState() => _FilterBrandListState();
}

class _FilterBrandListState extends State<FilterBrandList> {
  late final List<bool> values;
  List<BrandModel> brands = [];
  @override
  void initState() {
    super.initState();
    brands = context.read<Provide>().brands;

    values = List.filled(brands.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.grey[50],
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: brands.length,
        itemBuilder: (ctx, index) {
          var brand = brands[index];
          return ListTile(
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>  ItemsPage(id: brand.id))),
            shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            leading: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: CachedNetworkImageProvider(brand.image),
              ),
            ),
            title: Text(
              brand.name,
              style: txStl(15, Colors.black87, FontWeight.w500),
            ),
            trailing: Consumer<SortBarNotifier>(builder: (context, sortBar, _) {
              return Checkbox(
                value: sortBar.selectedBrand[index],
                onChanged: (value) =>
                    setState(() => sortBar.selectedBrand[index] = value!),
              );
            }),
          );
        },
      ),
    );
  }

  _build(BuildContext ctx, int i, CategoryModel category) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  ItemsByType(type: ItemSearchType.Category, id: category.id)))
       ;
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/icons/${category.image}"),
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
