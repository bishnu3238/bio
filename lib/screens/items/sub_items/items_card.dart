import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/empty_cart.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/items/item_details/item_details.dart';

import '../../../package/custom_widgets/custom_image.dart';
import 'items_card.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => ItemDetails(item: item)));
          },
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              CustomImage(
                item.image,
                fit: BoxFit.fitHeight,
                height: 125,
                radius: 8,
              ),
              ListTile(
                tileColor: kGrey.withOpacity(0.03),
                contentPadding: const EdgeInsets.fromLTRB(5, 0, 2, 10),
                titleAlignment: ListTileTitleAlignment.top,
                title: Text(item.name, overflow: TextOverflow.ellipsis),
                subtitle: Text(item.sub_title, overflow: TextOverflow.ellipsis),

                // TODO: remove textButton add row instead
                trailing: TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  onPressed: () {},
                  icon: const SizedBox(),
                  label: Text('$rupee ${item.final_price.toStringAsFixed(0)}',
                      style: stlT.copyWith(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
