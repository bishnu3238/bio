import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../class/app_constant.dart';
import '../../class/enums.dart';
import '../../class/widget_lavel_provider/sort_bar_notifier.dart';
import '../../methods/static_methods.dart';
import '../size_config.dart';
import '../text_style.dart';

class FilterList extends StatelessWidget {
  final SortBarNotifier sortBar;
  const FilterList(this.sortBar, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: sortBar.filterList.length,
      itemBuilder: (ctx, index) {
        var filter = sortBar.filterList[index]["label"] as ItemSearchType;
        bool isSelect = index == sortBar.filterIndex;
        return InkWell(
          onTap: () => sortBar.filterIndex = index,
          child: Container(
            alignment: Alignment.center,
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(70),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            color: isSelect ? null : Colors.grey[200],
            child: AutoSizeText(
              textCapitalize(filter.name),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: txStl(15, kDark, FontWeight.w700).copyWith(height: 1),
            ),
          ),
        );
      },
    );
  }
}
