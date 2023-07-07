import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../class/model/product_master/items_model.dart';

class CustomRatingBar extends StatelessWidget {
  final Color? color;
  final ItemModel item;
  final double? size;
  final Function(double)? onRatingChange;
  const CustomRatingBar(this.item,
      {super.key,
      this.size = 8.0,
      this.color = Colors.amber,
      this.onRatingChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RatingBar.builder(
            itemCount: 5,
            minRating: 0.5,
            itemSize: size!,
            updateOnDrag: false,
            initialRating: item.rating,
            glow: false,
            direction: Axis.horizontal,
            wrapAlignment: WrapAlignment.start,
            onRatingUpdate: (_) {},
            ignoreGestures: true,
            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
            itemBuilder: (context, _) =>
                FaIcon(FontAwesomeIcons.solidStar, color: color),
          ),
        ),
        Expanded(
          child: Text(
            "${item.rating}",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
