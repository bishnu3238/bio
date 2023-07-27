import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../package/custom_widgets/app_bars/simple_app_bar.dart';

class AllItemReviews extends StatelessWidget {
  final List reviews;

  const AllItemReviews({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
          title: 'Reviews',
          icon: Icons.keyboard_arrow_left_outlined,
          todo: () => Navigator.of(context).pop()),
      body: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListTile(
                title: Text(
                  '${reviews[index]['name']}'.toUpperCase(),
                  style: stlL.copyWith(fontWeight: FontWeight.w500),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(reviews[index]['review'], maxLines: 2),
                    const SizedBox(height: 10),
                    Text("Rating: ${reviews[index]['rating']}")
                  ],
                ),
              ),
            );
          }),
    );
  }
}
