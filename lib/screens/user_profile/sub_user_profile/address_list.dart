import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';
import 'package:universal_lab/screens/orders/sub_order/address_body.dart';
import '../../../package/size_config.dart';

import '../../../class/user_services/user_services.dart';
import 'address_empty.dart';
import 'addrss_tile.dart';

class AddressList extends StatelessWidget {
  final Function(String) callback;

 const AddressList({Key? key,required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserServices>(
      builder: (context, user, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: user.address.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return AddressTile(user.address[index], callback: callback);
          },
        );
      },
    );
  }
}
