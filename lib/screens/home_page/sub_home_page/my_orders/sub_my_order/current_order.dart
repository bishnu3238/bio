import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/size_config.dart';

import '../../../../../methods/order_function.dart';
import 'current_order_card.dart';

class CurrentOrder extends StatelessWidget {
  const CurrentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(builder: (context, provide, _) {
      var currentOrder = provide.currentOrder
          .where((element) =>
              element.delivered == '0' || element.delivered.isEmpty)
          .toList()
          .reversed
          .toList();
      if (currentOrder.isEmpty) {
        return Center(child: Image.asset('assets/images/empty_cart.png'));
      }

      return RefreshIndicator(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: currentOrder.length,
              itemBuilder: (ctx, index) {
                return CurrentOrderCard(currentOrder[index], provide);
              }),
          onRefresh: () async => orderFunction(context));
    });
  }
}
