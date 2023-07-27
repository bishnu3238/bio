import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/order/order_model.dart';
import 'package:universal_lab/package/size_config.dart';

import '../../../../user_profile/sub_user_profile/addrss_tile.dart';
import '../../settings/sub_settings/options_card.dart';

class ViewInvoice extends StatelessWidget {
  final OrderModel orderModel;
  const ViewInvoice(this.orderModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InteractiveViewer(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InvoiceInfo(orderModel: orderModel),
                  Addresses(orderModel: orderModel)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InvoiceInfo extends StatelessWidget {
  const InvoiceInfo({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
          height: getProportionateScreenHeight(150),
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                appLogo,
                width: getProportionateScreenWidth(100),
                height: getProportionateScreenHeight(50),
              ),
              const Text(appName),
              const AutoSizeText(
                appAddress,
                maxLines: 2,
              ),
              gap(5),
              const AutoSizeText("Contact Info $gPayNumber"),
              const AutoSizeText("Email Id Info@biocellar.com"),
            ],
          ),
        )),
        Expanded(
            child: Container(
                height: getProportionateScreenHeight(150),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Rows(
                      title: Text('Date Added: ${orderModel.date}'),
                      widget: const Text(""),
                    ),
                    Rows(
                      title: Text('Order ID: ${orderModel.id}'),
                      widget: const Text(""),
                    ),
                    Rows(
                      title: Text('Pay Methode: ${orderModel.paid}'),
                      widget: const Text(""),
                    ),
                    Rows(
                      title: Text('Shipping Methode: ${null}'),
                      widget: const Text(""),
                    ),
                  ],
                )))
      ],
    );
  }
}

class Addresses extends StatelessWidget {
  final OrderModel orderModel;
  const Addresses({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                child: const Column(
          children: [
            Rows(label: 'Payment Address', widget: SizedBox()),
            // AddressTile(orderModel.  callback: (String id ) {  },),
          ],
        ))),
        Expanded(
          child: Container(
              child: Column(
            children: [Rows(label: "Shipping Address", widget: SizedBox())],
          )),
        )
      ],
    );
  }
}
