import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/product_master/catergory_model.dart';
import 'package:universal_lab/screens/items/items_by_type.dart';

import '../../../../class/model/universal_lab_provider.dart';
import '../../../../screens/items/item_details/item_details.dart';
import '../../../../screens/items/items_page.dart';
import '../../../navigate.dart';
import '../../../size_config.dart';
import '../../../text_style.dart';

class FilterCategoryList extends StatelessWidget {
  const FilterCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categorys = context.read<Provide>().category;
    return ListView.builder(
        itemCount: categorys.length,
        itemBuilder: (ctx, index) {
          var category = categorys[index];
          return ListTile(
            onTap: () => Navigate.go(
              context,
              ItemsPage(id: category.id),
            ),
            shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            leading: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/icons/${category.image}"),
              ),
            ),
            title: Text(
              category.name,
              style: txStl(15, Colors.black87, FontWeight.w500),
            ),
            trailing: IconButton(
              icon: const Icon(
                size: 15,
                color: Colors.black,
                FontAwesomeIcons.angleRight,
              ),
              onPressed: () => Navigate.go(
                context,
                ItemsPage(id: category.id),
              ),
            ),
          );
        });
  }

  _build(BuildContext ctx, int i, CategoryModel category) {
    return InkWell(
      onTap: () {
        Navigate.go(
          ctx,
          ItemsByType(type: ItemSearchType.Category, id: category.id),
        );
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
