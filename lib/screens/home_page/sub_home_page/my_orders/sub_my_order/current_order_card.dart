import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/order/order_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

import '../../../../../package/size_config.dart';
import '../order_details/order_details.dart';
import '../../../../../package/text_style.dart';
import '../view_invoice/view_invoice.dart';

class CurrentOrderCard extends StatelessWidget {
  final Provide provide;
  final OrderModel currentOrder;

  const CurrentOrderCard(this.currentOrder, this.provide, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => OrderDetails(currentOrder)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3.0),
        child: OptionsCard(elevation: 5, listOfWidget: [
          Text("Order No: ${currentOrder.invoiceId} ${currentOrder.id}"
              .toUpperCase()),
          Text(
            "Total Item Purchased: ${currentOrder.orderItems.length}",
            style: txStl(15, kGrey, null),
          ),
          Row(
            children: [
              Text(
                  "Order Status: ${currentOrder.isConfirmed ? "Accept" : "Pending"}",
                  style: stlight.copyWith(
                      color: currentOrder.isConfirmed ? kSuccess : kError)),
              const Spacer(),
              currentOrder.isConfirmed
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => ViewInvoice(currentOrder)));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "View Invoice",
                            style: stlH4.copyWith(
                                color: kOrange, fontWeight: FontWeight.w300),
                          )))
                  : const SizedBox(),
            ],
          ),
          Text("Ordered Date: ${currentOrder.date}",
              style: txStl(15, kGrey, null)),
        ]),
      ),
    );
  }
}
