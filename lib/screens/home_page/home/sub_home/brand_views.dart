import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_info.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../../package/custom_widgets/divide.dart';
import 'view_all_text.dart';

class BrandViews extends StatelessWidget {
  const BrandViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ViewAllText(title: 'Featured Brands', viewAll: () {}),
        SizedBox(
          height: getProportionateScreenHeight(100),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: context.read<Provide>().brands.length,
            itemBuilder: (ctx, index) {
              var brand = context.read<Provide>().brands[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(100),
                          height: getProportionateScreenHeight(40),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/${brand.image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                         Divider(
                          height: 2,
                          thickness: 2,color: Colors.red[200],
                        ),
                        Text(brand.brandName, style: stl1(12, null, null))
                      ],
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
