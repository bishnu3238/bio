import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/order/order_item_model.dart';
import 'package:universal_lab/class/model/order/order_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/screens/home_page/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../../../package/custom_widgets/app_bars/simple_app_bar.dart';
import '../../../../../package/custom_widgets/user_icon.dart';
import 'order_details_body/order_details_card.dart';
import 'ordered_item_details/ordered_item_details.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel currentOrder;
  const OrderDetails(this.currentOrder, {Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: widget.currentOrder.date.convertToDMY,
        icon: Icons.keyboard_arrow_left_sharp,
        todo: () => Navigator.of(context).pop(),
        buttons: const [
          UserIcon(),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.currentOrder.orderItems.length,
        itemBuilder: (ctx, index) {
          Provide provide = context.read<Provide>();
          OrderItemModel orderItem = widget.currentOrder.orderItems[index];
          return GestureDetector(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (_)=> OrderedItemDetails(orderItem)));
            },
            child: OrderDetailsCard(
              index: index,
              provide: provide,
              orderItem: orderItem,
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(isHome: false),
    );
  }
}

extension ConvertToDateTime on String {
  get convertToDMY {
    DateTime parsedDate = DateTime.parse(this);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
    return formattedDate;
  }
}
