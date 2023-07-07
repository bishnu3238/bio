import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../../class/enums.dart';
import '../../../items/items_page.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return Scaffold(
      appBar: const AppAppBar(
        title: "Category",
        tPosition: false,
        buttons: [UserIcon()],
      ),
      body: Consumer<Provide>(
        builder: (context, provide, _) {
          var categories = provide.category;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: categories.length,
                  (context, index) {
                    var category = categories[index];
                    return ListTile(
                      onTap: () {
                        context.read<Provide>().itemsFromSearchType(
                            ItemSearchType.Category, category.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ItemsPage(id: category.id)),
                        );
                      },
                      shape: Border(
                          bottom: BorderSide(color: Colors.grey.shade200)),
                      leading: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CustomImage(
                          radius: 50,
                          category.image,
                          height: 40,
                          width: 40,
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ItemsPage(id: category.id),
                            )),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
