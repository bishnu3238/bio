import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';

import '../../../../package/custom_widgets/app_bars/sliver_appbar_delegate.dart';

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
          margin: const EdgeInsets.only(left: 5),
          color: Colors.white,
          child: Consumer<Notifier>(builder: (context, notify, _) {
            List sortingButtons = notify.sortingButtons;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ActionChip(
                  elevation: 3,
                  backgroundColor: Colors.white,
                  avatar: FaIcon(sortingButtons[index]['icon'], size: 15),
                  label: Text(sortingButtons[index]['label']),
                  onPressed: () {
                    notify.sortingIndex = index;
                    notify.onSortingBarTap(context);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(padding: EdgeInsets.all(8));
              },
              itemCount: sortingButtons.length,
            );
          }),
        ),
      ),
    );
  }
}
