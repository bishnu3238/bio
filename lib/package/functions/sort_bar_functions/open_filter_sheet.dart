import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

import '../../../class/widget_lavel_provider/services/sort_filter_services.dart';
import '../../../methods/static_methods.dart';
import '../../custom_widgets/filter_list.dart';

openFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: getProportionateScreenHeight(812) - kToolbarHeight,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Rows(
              label: "Filter",
              textStyle: txStl(18, kDBlue, FontWeight.w500),
              widget: TextButton(onPressed: () {}, child: const Text("clear")),
            ),
            const Divider(height: 0),
            Expanded(
              child: Consumer<SortBarNotifier>(
                builder: (context, sortBar, _) {
                  var filterList = sortBar.filterList;
                  return Row(
                    children: [
                      Expanded(flex: 1, child: FilterList(sortBar)),
                      Expanded(
                        flex: 2,
                        child: filterList[sortBar.filterIndex]["widget"],
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[300]!))),
              child: Row(
                children: [
                  _buttons(context, "Close", null, () {
                    Navigator.pop(context);
                  }),
                  _buttons(context, "Apply", kLight, () {
// TODO: apply filter;
                    filterfilter(context);
                  }),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

Expanded _buttons(
    BuildContext context, String text, Color? color, VoidCallback onTap) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: color != null ? kError : null,
        child: Text(
          text,
          style: txStl(20, color, FontWeight.normal),
        ),
      ),
    ),
  );
}
