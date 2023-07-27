import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/package/text_style.dart';

class FilterRating extends StatefulWidget {
  const FilterRating({Key? key}) : super(key: key);

  @override
  State<FilterRating> createState() => _FilterRatingState();
}

class _FilterRatingState extends State<FilterRating> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rating.length,
      itemBuilder: (ctx, index) {
        var rate = rating[index];
        return ListTile(
          onTap: () {},
          shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          leading: Consumer<SortBarNotifier>(builder: (context, sortBar, _) {
            return Checkbox(
                value: sortBar.selectedRating[index],
                onChanged: (value) {
                  setState(() {
                    for (int i = 0; i < sortBar.selectedRating.length; i++) {
                      if (i == index) {
                        sortBar.selectedRating[i] = true;
                      } else {
                        sortBar.selectedRating[i] = false;
                      }
                    }
                  });
                });
          }),
          title: Row(
            children: [
              Text(
                rate,
                style: txStl(15, Colors.black87, FontWeight.w500),
              ),
              const FaIcon(FontAwesomeIcons.star, size: 15)
            ],
          ),
        );
      },
    );
  }
}
