import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/cart/cart_screen.dart';

import '../../../../../class/app_constant.dart';
import '../../../../../package/custom_widgets/cart_icon.dart';
import '../../../../../package/custom_widgets/text_form_field.dart';
import '../../../../../package/custom_widgets/user_icon.dart';
import '../../../../../search/searchAllInBioCellar.dart';
import '../../../../../search/search_data_provider.dart';
import '../../../../../search/search_filter_provider.dart';
import '../../../../authentication/log_in/log_in.dart';
import '../../../../items/items_by_type.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 2,
      backgroundColor: Colors.white,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/logo/toplesslogo.png',
        width: getProportionateScreenWidth(120),
        height: getProportionateScreenHeight(30),
      ),
      actions: const [
        CartIcon(),
        UserIcon(),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.maxFinite, kToolbarHeight + 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: CustomTextField(
            hintText: 'Search in BioCellar ...',
            // prefixIcon: FontAwesomeIcons.magnifyingGlass,
            suffixIcon: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade700,
                  border: Border.all(color: Colors.black38),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: IconButton(
                onPressed: () {
                  // TODO: search with microphone;
                },
                icon: FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.grey[50],
                ),
              ),
            ),
            readOnly: true,
            onTap: () async {
              // TODO: search all things in bioCellar;

              SearchFilterProvider.initialize(context);
              SearchFilterProvider().searchAllInBioCellar();
            },
          ),
        ),
      ),
    );
  }
}
