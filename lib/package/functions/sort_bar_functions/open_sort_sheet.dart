import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../text_style.dart';

openSortSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Sort By',
                style: txStl(15, Colors.black, FontWeight.normal),
              ),
            ),
            const Divider(height: 0),
            buildSortingOption(
              'Best Seller',
              Colors.white,
              onPressed: () {
                // TODO: Handle sorting by best seller
                Navigator.pop(context);
              },
            ),
            buildSortingOption(
              'Price',
              Colors.grey[200],
              onPressed: () {
                // TODO: Handle sorting by price
                Navigator.pop(context);
              },
            ),
            buildSortingOption(
              'Discount',
              Colors.white,
              onPressed: () {
                // TODO: Handle sorting by discount
                Navigator.pop(context);
              },
            ),
            buildSortingOption(
              'Customer Rating',
              Colors.grey[200],
              onPressed: () {
                // TODO: Handle sorting by customer rating
                Navigator.pop(context);
              },
            ),
            buildSortingOption(
              'A-Z',
              Colors.white,
              onPressed: () {
                // TODO: Handle sorting A-Z
                Navigator.pop(context);
              },
            ),
            buildSortingOption(
              'Z-A',
              Colors.grey[200],
              onPressed: () {
                // TODO: Handle sorting Z-A
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget buildSortingOption(String title, Color? color,
    {required VoidCallback onPressed}) {
  return Container(
    color: color,
    child: InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          style: stlL,
        ),
      ),
    ),
  );
}
