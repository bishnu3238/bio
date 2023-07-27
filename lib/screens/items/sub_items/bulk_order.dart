import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';

import '../../../class/app_constant.dart';
import '../../orders/sub_order/place_bulk_order.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';

class BulkOrder extends StatelessWidget {
  const BulkOrder(ItemModel item, {super.key}) : _item = item;
  final ItemModel _item;
  @override
  Widget build(BuildContext context) {
    return OptionsCard(listOfWidget: [
      Rows(
        icon: FontAwesomeIcons.firstOrder,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bulk Order",
              style: stlBtn(null),
            ),
            const Text("Order in bulk."),
          ],
        ),
        widget: OutlinedButton(
            onPressed: () {
              context.read<AuthService>().authenticationStatus().then((value) =>
                  value != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => PlaceBulkOrder(_item)))
                      : CustomSnackBar.showToast('You have to login first',
                          kDark.withOpacity(0.8), ToastGravity.TOP));
            },
            child: const Text("now")),
      )
    ]);
  }
}
