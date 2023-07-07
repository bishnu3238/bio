import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import '../../../../../class/enums.dart';
import '../../../../../class/model/provider.dart';
import '../../../../../package/size_config.dart';
import '../../../../../package/text_style.dart';
import '../../../../brands/brands.dart';
import '../../../../items/items_by_type.dart';
import 'view_all_text.dart';

class BrandViews extends StatelessWidget {
  const BrandViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ViewAllText(
            title: 'Featured Brands',
            viewAll: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Brands()))),
        SizedBox(
          height: getProportionateScreenHeight(120),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: context.read<Provide>().brands.length,
            itemBuilder: (ctx, index) {
              var brand = context.read<Provide>().brands[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context
                        .read<Provide>()
                        .itemsFromSearchType(ItemSearchType.Brand, brand.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ItemsByType(
                          type: ItemSearchType.Brand,
                          id: brand.id,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: getProportionateScreenWidth(150),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 15, 5),
                        child: Column(
                          children: [
                            SizedBox(
                                width: getProportionateScreenWidth(110),
                                height: getProportionateScreenHeight(60),
                                child: CustomImage(brand.image)),
                            AutoSizeText(
                              brand.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: stl1(14, null, FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
