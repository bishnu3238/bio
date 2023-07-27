import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../class/widget_lavel_provider/sort_bar_notifier.dart';
import '../../../text_style.dart';

class FlitterDiscount extends StatefulWidget {
  const FlitterDiscount({Key? key}) : super(key: key);

  @override
  State<FlitterDiscount> createState() => _FlitterDiscountState();
}

class _FlitterDiscountState extends State<FlitterDiscount> {
  // late final List<bool> values;
  // @override
  // void initState() {
  //   super.initState();
  //
  //   values = List.filled(discounts.length, false);
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: discounts.length,
        itemBuilder: (ctx, index) {
          var discount = discounts[index];
          return ListTile(
            onTap: () {},
            shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            leading: Consumer<SortBarNotifier>(builder: (context, sortBar, _) {
              return Checkbox(
                  value: sortBar.selectedDiscount[index],
                  onChanged: (value) {
                    setState(() {
                      for (int i = 0;
                          i < sortBar.selectedDiscount.length;
                          i++) {
                        if (i == index) {
                          sortBar.selectedDiscount[i] = true;
                        } else {
                          sortBar.selectedDiscount[i] = false;
                        }
                      }
                    });
                  });
            }),

            // Checkbox(
            //     value: values[index],
            //     onChanged: (value) => setState(() => values[index] = value!)),
            title: Text(
              "under $discount %",
              style: txStl(15, Colors.black87, FontWeight.w500),
            ),
          );
        });
  }
}
