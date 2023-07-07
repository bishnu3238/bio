import 'package:flutter/material.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import '../../../../methods/order_function.dart';
import 'sub_my_order/current_order.dart';
import 'sub_my_order/history.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();

    orderFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Orders",
        tPosition: false,
        buttons: const [UserIcon()],
        tabBarHeight: kToolbarHeight * 2,
        tabBar: TabBar(controller: _tabController, tabs: const [
          Tab(child: Text("Current Order")),
          Tab(child: Text("History"))
        ]),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          CurrentOrder(),
          History(),
        ],
      ),
    );
  }
}
