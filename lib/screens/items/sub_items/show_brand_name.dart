import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';

import '../../../class/master.dart';


class ShowBrandName extends StatelessWidget {

  final ItemModel item;
  const ShowBrandName({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                         Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FaIcon(
            FontAwesomeIcons.sellcast,
            color: Colors.purple,
            size: 15,
          ),
          const SizedBox(width: 5),
          Text(
              Master()
                  .provide
                  .brand(item.brandId)
                  .name,
              style: TextStyle(color: Colors.purple[800]),
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );

  }
}
