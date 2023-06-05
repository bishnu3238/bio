import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final Function(double)? onRatingChange;
  const CustomRatingBar(this.rating, {super.key, this.onRatingChange});

  @override
  Widget build(BuildContext context) {
    var rate = rating;
    return Row(
      children: [
        Expanded(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 10,
            wrapAlignment: WrapAlignment.start,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
            itemBuilder: (context, _) => const FaIcon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) => onRatingChange,
          ),
        ),
        Expanded(child: Text("$rate"))
      ],
    );
  }
}
