import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/sliver_appbar_delegate.dart';
import '../../../class/app_constant.dart';
import '../../../class/model/check_out_service/check_out_service.dart';
import '../../../package/custom_widgets/app_bars/simple_app_bar.dart';
import '../../../package/size_config.dart';
import '../../cart/cart_screen.dart';

class CheckOutAppBar extends StatelessWidget {
  final List<Widget>? buttons;
  const CheckOutAppBar({Key? key, this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverAppBarDelegate(
        maxHeight: kToolbarHeight,
        minHeight: kToolbarHeight,
        child: Consumer<CheckOutService>(
          builder: (ctx, checkOut, _) {
            return checkOutAppBar(context, checkOut, buttons);
          },
        ),
      ),
    );
  }
}

SimpleAppBar checkOutAppBar(
    BuildContext context, CheckOutService checkOut, List<Widget>? buttons) {
  return SimpleAppBar(
    tPosition: false,
    icon: Icons.chevron_left,
    todo: () {
      log(checkOut.progressIndex.toString());
      checkOut.progressIndex <= 0
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => const CartScreen()))
          : --checkOut.progressIndex;
    },
    title: CheckOutStages.values[checkOut.progressIndex].name,
    buttons: [...?buttons],
  );
}
