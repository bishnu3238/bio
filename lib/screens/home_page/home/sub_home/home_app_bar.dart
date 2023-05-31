import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/cart.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/cart/cart_screen.dart';

import '../../../../class/app_info.dart';
import '../../../../package/custom_widgets/cart_icon.dart';
import '../../../../package/custom_widgets/text_form_field.dart';
import '../../../../package/custom_widgets/user_icon.dart';
import '../../../../package/navigate.dart';
import '../../../authentication/log_in.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 2,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.bars, size: 25)),
      centerTitle: false,
      title: Image.asset('assets/logo/app_logo.png'),
      // Text(
      //   AppConstant.name,
      //   style: stlH2,
      // ),
      actions: const [
        CartIcon(),
        UserIcon(),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.maxFinite, kToolbarHeight + 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: CustomTextField(
            hintText: 'Search ...',
            prefixIcon: FontAwesomeIcons.magnifyingGlass,
            suffixIcon: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade700,
                  border: Border.all(color: Colors.black38),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.microphone,
                      color: Colors.grey[50],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
