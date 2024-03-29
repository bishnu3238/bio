import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../../../../package/custom_widgets/app_bars/sliver_appbar_delegate.dart';
import '../../../../../class/widget_lavel_provider/sort_bar_notifier.dart';

class SortBar extends StatelessWidget {
  const SortBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          padding: const EdgeInsets.only(left: 5),
          color: kLight,
          child: Consumer<SortBarNotifier>(
            builder: (context, sortBar, _) {
              List sortingButtons = sortBar.sortingButtons;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ActionChip(
                    elevation: 3,
                    backgroundColor: kLight,
                    avatar: FaIcon(sortingButtons[index]['icon'], size: 15),
                    label: Text(sortingButtons[index]['label']),
                    onPressed: () {
                      sortBar.sortingIndex = index;
                      sortBar.onSortingBarTap(context);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(padding: EdgeInsets.all(8));
                },
                itemCount: sortingButtons.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

class SortBar2 extends StatelessWidget {
  const SortBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          padding: const EdgeInsets.only(left: 5),
          width: getProportionateScreenWidth(375),
          color: kLight,
          child: Consumer<SortBarNotifier>(
            builder: (context, sortBar, _) {
              List sortingButtons = sortBar.sortingButtons;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: getProportionateScreenWidth((kLayoutWidth) / 2),
                    decoration: const BoxDecoration(color: kLight),
                    child: TextButton.icon(
                      icon: FaIcon(sortingButtons[index]['icon'],
                          size: 15, color: kDBlue),
                      label: Text(sortingButtons[index]['label'], style: stlL),
                      onPressed: () {
                        sortBar.sortingIndex = index;
                        sortBar.onSortingBarTap(context);
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(padding: EdgeInsets.all(8));
                },
                itemCount: sortingButtons.length > 2 ? 2 : 2,
              );
            },
          ),
        ),
      ),
    );
  }
}
