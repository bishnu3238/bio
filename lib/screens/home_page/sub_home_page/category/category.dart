import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../items/items_page.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BioCellar.initialize(context);
    return Scaffold(
      appBar: const AppAppBar(title: "Category", tPosition: false),
      body: Consumer<Provide>(
        builder: (context, provide, _) {
          var categories = provide.category;
          // var isExpanded = List.filled(categories.length, false);
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: categories.length,
                  (context, index) {
                    var category = categories[index];
                    return ListTile(
                      onTap: () => Navigate.go(
                        context,
                        ItemsPage(id: category.id),
                      ),
                      shape: Border(
                          bottom: BorderSide(color: Colors.grey.shade200)),
                      leading: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/icons/${category.image}"),
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
