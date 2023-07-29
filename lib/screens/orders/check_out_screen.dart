import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/check_out_service/check_out_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import 'package:universal_lab/screens/cart/sub_cart/cart_body.dart';
import 'sub_order/address_body.dart';
import 'sub_order/check_out_app_bar.dart';
import 'sub_order/check_out_nav_bar.dart';
import 'sub_order/check_out_progress_bar.dart';
import 'sub_order/payment_body.dart';
import 'sub_order/summery.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(builder: (context, notify, _) {
      return Consumer<CheckOutService>(builder: (context, checkOut, _) {
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
                return [const CheckOutAppBar(buttons: [UserIcon(isHome: false,)]), const CheckOutProgressBar()];
              },
              body: [
                const CartBody(),
                const AddressBody(),
                const PaymentBody(), //TODO: payment body
                const Summery(), //TODO: summery body
              ][checkOut.progressIndex],
            ),
          ),
          persistentFooterButtons: checkOutFooter(context),
        );
      });
    });
  }
}
