import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

openFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
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
              child: Consumer<Notifier>(builder: (context, notify, _) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FilterList(notify),
                    ),
                    Expanded(
                      flex: 2,
                      child: notify.filterList[notify.filterIndex]["widget"],
                    ),
                  ],
                );
              }),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[300]!))),
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Close",
                            style: txStl(20, Colors.black45, FontWeight.normal),
                          ))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            // TODO: apply filter
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.redAccent[400])),
                          child: Text(
                            "Apply",
                            style: txStl(20, Colors.white, FontWeight.normal),
                          ))),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

class FilterList extends StatelessWidget {
  final Notifier notify;
  const FilterList(this.notify, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: notify.filterList.length,
        itemBuilder: (ctx, index) {
          var filter = notify.filterList[index]["label"];
          bool isSelect = index == notify.filterIndex;
          return InkWell(
              onTap: () => notify.filterIndex = index,
              child: Container(
                width: getProportionateScreenWidth(60),
                height: getProportionateScreenHeight(70),
                decoration: BoxDecoration(
                  color: isSelect ? null : Colors.grey[300],
                  borderRadius: isSelect
                      ? null
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(5)),
                ),
                child: Center(child: Text(filter)),
              ));
        });
  }
}
