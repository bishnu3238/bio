import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/order/order_item_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/size_config.dart';

import '../../../../../../package/custom_widgets/custom_image.dart';

class OrderedItemDetails extends StatelessWidget {
  final OrderItemModel orderItem;
  const OrderedItemDetails(this.orderItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: orderItem.productName,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(orderItem.getImage(context),
                height: getProportionateScreenHeight(400)),
            Center(
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}

extension GetImage on OrderItemModel {
  String getImage(BuildContext context) {
    return context
        .read<Provide>()
        .items
        .firstWhere((element) => element.id == id)
        .image;
  }
}
