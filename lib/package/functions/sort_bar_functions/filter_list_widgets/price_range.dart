import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/sort_bar_notifier.dart';
import 'package:universal_lab/package/text_style.dart';

class FilterPriceRange extends StatefulWidget {
  const FilterPriceRange({Key? key}) : super(key: key);

  @override
  State<FilterPriceRange> createState() => _FilterPriceRangeState();
}

class _FilterPriceRangeState extends State<FilterPriceRange> {
  // late final List<bool> values;
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // values = List.filled(price.length, false);
  // }

  // double _lowerValue = 1000;
  // double _upperValue = 10000;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: p.length,
      itemBuilder: (ctx, index) {
        var priceRange = p[index];
        return ListTile(
          onTap: () {},
          shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          leading: Consumer<SortBarNotifier>(
            builder: (context, sortBar, _) {
              return Checkbox(
                value: sortBar.selectedPrice[index],
                onChanged: (value) => setState(() {
                  for (int i = 0; i < sortBar.selectedPrice.length; i++) {
                    if (i == index) {
                      sortBar.selectedPrice[i] = true;
                    } else {
                      sortBar.selectedPrice[i] = false;
                    }
                  }
                }),
              );
            },
          ),

          // Checkbox(
          //     value: values[index],
          //     onChanged: (value) => setState(() => values[index] = value!)),
          title: Text("${priceRange['min']} - ${priceRange['max']}"),
          // index == (price.length - 1)
          //     ? Text(
          //         "above $priceRange",
          //         style: txStl(15, Colors.black87, FontWeight.w500),
          //       )
          //     : Text(
          //         "under $priceRange",
          //         style: txStl(15, Colors.black87, FontWeight.w500),
          //       ),
        );
      },
    );

    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         "Price range",
    //         style: stl1(18, Colors.black, FontWeight.bold),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: FlutterSlider(
    //         values: [_lowerValue, _upperValue],
    //         rangeSlider: true,
    //         max: 1000000,
    //         min: 0,
    //         selectByTap: true,
    //         handler: FlutterSliderHandler(
    //             child: const FaIcon(FontAwesomeIcons.rupeeSign)),
    //         rightHandler: FlutterSliderHandler(
    //             child: const FaIcon(FontAwesomeIcons.rupeeSign)),
    //         tooltip: FlutterSliderTooltip(
    //           textStyle: const TextStyle(fontSize: 17, color: Colors.white),
    //           boxStyle: FlutterSliderTooltipBox(
    //             decoration:
    //                 BoxDecoration(color: Colors.redAccent.withOpacity(0.7)),
    //           ),
    //         ),
    //         onDragging: (handlerIndex, lowerValue, upperValue) {
    //           log(lowerValue.runtimeType.toString());
    //           _lowerValue = lowerValue;
    //           _upperValue = upperValue;
    //           setState(() {});
    //         },
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         "\u{20B9}${_lowerValue.toStringAsFixed(2)} to \u{20B9}${_upperValue.toStringAsFixed(2)}",
    //         style: stl1(18, kDBlue, FontWeight.normal),
    //       ),
    //     )
    //   ],
    // );
  }
}
