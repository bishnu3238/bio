import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

import '../../../class/widget_lavel_provider/services/sort_filter_services.dart';
import '../../../methods/static_methods.dart';
import '../../custom_widgets/filter_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

openCategorySheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        // height: getProportionateScreenHeight(812) - kToolbarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Rows(
              label: "Category",
              textStyle: txStl(18, kDBlue, FontWeight.w500),
              widget: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const FaIcon(FontAwesomeIcons.xmark)),
            ),
            const Divider(height: 0),
            Expanded(
              child: Consumer<Provide>(
                builder: (context, provide, _) {
                  var categoryList = provide.category;
                  return GridView.builder(
                    itemCount: categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<Provide>().itemsFromSearchType(
                              ItemSearchType.Category, categoryList[index].id);
                          Navigator.of(context).pop(categoryList[index].name);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: getProportionateScreenHeight(45),
                                width: getProportionateScreenWidth(45),
                                decoration: BoxDecoration(
                                  color: kOrange.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: CachedNetworkImageProvider(
                                      categoryList[index].image,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                categoryList[index].name,
                                style: stlT.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
