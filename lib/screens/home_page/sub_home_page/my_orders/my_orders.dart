import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
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

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    orderFunction(context);

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startRotation() {
    _controller.repeat();
  }

  void stopRotation() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Orders",
        tPosition: false,
        buttons: const [UserIcon()],
        tabBarHeight: kToolbarHeight * 2,
        tabBar: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(child: Text("Current Order")),
            Tab(child: Text("History"))
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          CurrentOrder(),
          History(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDBlue,
        onPressed: () {
          AuthStatus status = context.read<AuthService>().authStatus;
          startRotation();
          status == AuthStatus.Login ? null : stopRotation();

          status == AuthStatus.Login
              ? orderFunction(context).then((value) {
                  stopRotation();
                  CustomSnackBar.showToast(
                    'Updated',
                    kDark.withOpacity(0.5),
                    ToastGravity.BOTTOM,
                  );
                })
              : CustomSnackBar.showToast('You are not login', kDBlue);
        },
        child: RotationTransition(
          turns: _controller,
          child: const FaIcon(FontAwesomeIcons.arrowsRotate),
        ),
      ),
    );
  }
}
