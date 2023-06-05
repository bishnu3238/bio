import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';

import 'sub_my_order/current_order.dart';
import 'sub_my_order/history.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppAppBar(
          title: "Orders",
          tPosition: false,
          tabBarHeight: kToolbarHeight * 2,
          tabBar: TabBar(tabs: [
            Tab(child: Text("Current Order")),
            Tab(child: Text("History"))
          ]),
        ),
        body: TabBarView(
          children: [
            CurrentOrder(),
            History(),
          ],
        ),
      ),
    );
  }
}
