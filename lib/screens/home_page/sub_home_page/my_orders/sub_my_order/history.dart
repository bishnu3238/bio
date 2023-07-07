import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../class/model/provider.dart';
import 'current_order_card.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(builder: (context, provide, _) {
      var currentOrder = provide.currentOrder
          .where((element) => element.delivered == '1')
          .toList();
      if (currentOrder.isEmpty) {
        return Center(child: Image.asset('assets/images/empty_cart.png'));
      }

      return ListView.builder(
          shrinkWrap: true,
          itemCount: currentOrder.length,
          itemBuilder: (ctx, index) {
            return CurrentOrderCard(currentOrder[index], provide);
          });
    });
  }
}
