import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/search/searchAllInBioCellar.dart';

import '../../class/model/cart/cart.dart';
import '../../class/model/provider.dart';
import '../../screens/cart/cart_screen.dart';
import '../../search/search_filter_provider.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        return IconButton(
          onPressed: () {
            SearchFilterProvider.initialize(context);
            SearchFilterProvider().searchAllInBioCellar();
          },
          icon: const Icon(Icons.search),
        );
      },
    );
  }
}
