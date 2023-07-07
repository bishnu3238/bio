import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';

class PageIndicator extends StatelessWidget {
  final int index;
  const PageIndicator({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (context, notifier, _) {
        return AnimatedContainer(
          duration: kAnimationDuration,
          curve: Curves.easeIn,
          margin: const EdgeInsets.only(right: 5),
          height: 6,
          width: notifier.pageIndicator == index ? 20 : 6,
          decoration: BoxDecoration(
            color: notifier.pageIndicator == index
                ? kDark
                : const Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      },
    );
  }
}
class ItemImageIndicator extends StatelessWidget {
  final int index;
  const ItemImageIndicator({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (context, notifier, _) {
        return AnimatedContainer(
          duration: kAnimationDuration,
          curve: Curves.easeIn,
          margin: const EdgeInsets.only(right: 5),
          height: 6,
          width: notifier.itemImageIndicator == index ? 20 : 6,
          decoration: BoxDecoration(
            color: notifier.itemImageIndicator == index
                ? kDark
                : const Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      },
    );
  }
}
