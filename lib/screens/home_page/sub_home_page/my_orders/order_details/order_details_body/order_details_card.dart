import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/order/order_item_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../../../items/sub_items/stack_icon.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.index,
    required this.provide,
    required this.orderItem,
  });
  final int index;
  final Provide provide;
  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          isThreeLine: true,
          tileColor: index.isEven ? kGrey.withOpacity(0.05) : kLight,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${index + 1}.",
                style: stlH3(),
              ),
              gap(10, 1),
              CustomImage(provide.getProductImage(orderItem.productId),
                  width: 80, height: 100),
            ],
          ),
          title: AutoSizeText(orderItem.productName, style: stlight),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                orderItem.categoryName,
                style: stlH6.copyWith(color: kGrey),
              ),
              Text(
                "Quantity:  ${orderItem.quantity}",
                style: stlH4.copyWith(color: kDark, fontSize: 10),
              ),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$rupee ${orderItem.price}",
                style: stlH5.copyWith(color: kSuccess),
              ),
              Text(
                "Total: ${orderItem.totalPrice}",
                style: stlight,
              ),
            ],
          ),
        ),
        StackCustomIcon(
          onTap: () {},
          iconColor: orderItem.delivered == '1' ? kSuccess : kError,
          icon: orderItem.delivered == '1' ? Icons.task_alt : Icons.error,
        )
      ],
    );
  }
}
