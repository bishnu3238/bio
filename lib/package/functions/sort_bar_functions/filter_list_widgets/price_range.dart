import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/text_style.dart';

class FilterPriceRange extends StatefulWidget {
  const FilterPriceRange({Key? key}) : super(key: key);

  @override
  State<FilterPriceRange> createState() => _FilterPriceRangeState();
}

class _FilterPriceRangeState extends State<FilterPriceRange> {
  double _lowerValue = 1000;
  double _upperValue = 10000;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Price range",
            style: stl1(18, Colors.black, FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlutterSlider(
            values: [_lowerValue, _upperValue],
            rangeSlider: true,
            max: 1000000,
            min: 0,
            selectByTap: true,
            handler: FlutterSliderHandler(
                child: const FaIcon(FontAwesomeIcons.rupeeSign)),
            rightHandler: FlutterSliderHandler(
                child: const FaIcon(FontAwesomeIcons.rupeeSign)),
            tooltip: FlutterSliderTooltip(
              textStyle: const TextStyle(fontSize: 17, color: Colors.white),
              boxStyle: FlutterSliderTooltipBox(
                decoration:
                    BoxDecoration(color: Colors.redAccent.withOpacity(0.7)),
              ),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              log(lowerValue.runtimeType.toString());
              _lowerValue = lowerValue;
              _upperValue = upperValue;
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "\u{20B9}${_lowerValue.toStringAsFixed(2)} to \u{20B9}${_upperValue.toStringAsFixed(2)}",
            style: stl1(18, kDBlue, FontWeight.normal),
          ),
        )
      ],
    );
  }
}
