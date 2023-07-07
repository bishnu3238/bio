import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../class/model/provider.dart';
import '../screens/items/items_by_type.dart';
import 'searchAllInBioCellar.dart';
import '../class/enums.dart';
import '../class/model/product_master/items_model.dart';
import '../screens/items/item_details/item_details.dart';

class SearchFilterProvider {
  static late BuildContext _context;
  static void initialize(BuildContext context) => _context = context;

  Provide get provide => _context.read<Provide>();

  Future searchAllInBioCellar() async {
    await showSearch(context: _context, delegate: SearchAllInBioCellar(provide))
        .then(
      (value) {
        if (value == null) return;
        if (value.type == ItemSearchType.Item) {
          ItemModel item = _context.read<Provide>().getItemFromId(value.id);
          Navigator.push(_context,
              MaterialPageRoute(builder: (ctx) => ItemDetails(item: item)));
        } else {
          _context.read<Provide>().itemsFromSearchType(value.type!, value.id);
          Navigator.push(
              _context,
              MaterialPageRoute(
                  builder: (ctx) =>
                      ItemsByType(type: value.type!, id: value.id)));
        }
      },
    );
  }
}
