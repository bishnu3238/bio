import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../class/model/universal_lab_provider.dart';
import '../screens/items/items_by_type.dart';
import 'searchAllInBioCellar.dart';
import '../class/enums.dart';
import '../class/model/product_master/items_model.dart';
import '../package/navigate.dart';
import '../screens/items/item_details/item_details.dart';

class SearchFilterProvider {
  static late BuildContext _context;
  static void initialize(BuildContext context) => _context = context;

  Provide get provide => _context.read<Provide>();

 Future searchAllInBioCellar() async {
    await showSearch(context: _context, delegate: SearchAllInBioCellar(provide))
        .then((value) {
      if (value == null) return;

      if (value.type == ItemSearchType.Item) {
        ItemModel item = _context.read<Provide>().getItemFromId(value.id);
        Navigate.go(_context, ItemDetails(item: item));
      } else {
        Navigate.go(_context, ItemsByType(type: value.type!, id: value.id));
      }
    });
  }
}
