import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../../../package/custom_widgets/divide.dart';
import '../../../../brands/brands.dart';
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
            viewAll: () => Navigate.go(context, const Brands())),
        SizedBox(
          height: getProportionateScreenHeight(120),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: context.read<Provide>().brands.length > 6
                ? 6
                : context.read<Provide>().brands.length,
            itemBuilder: (ctx, index) {
              var brand = context.read<Provide>().brands[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    log(brand.name);
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(100),
                            height: getProportionateScreenHeight(60),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                brand.image,
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 2,
                            color: Colors.red[200],
                          ),
                          Text(brand.name,
                              style: stl1(14, null, FontWeight.w500))
                        ],
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
