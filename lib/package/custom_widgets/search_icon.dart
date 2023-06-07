import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/search/searchAllInBioCellar.dart';

import '../../class/model/cart/cart.dart';
import '../../class/model/universal_lab_provider.dart';
import '../../screens/cart/cart_screen.dart';
import '../navigate.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        return IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchAllInBioCellar(provide));
          },
          icon: const Icon(Icons.search),
        );
      },
    );
  }
}
