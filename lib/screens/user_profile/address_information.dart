import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/custom_decorations/text_field_decoration/under_input_decoration.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import '../../class/user_services/user_services.dart';
import '../../package/custom_widgets/app_bars/simple_app_bar.dart';
import '../home_page/sub_home_page/settings/sub_settings/options_card.dart';
import 'sub_user_profile/add_new_address.dart';
import '../orders/sub_order/address_body.dart';
import 'sub_user_profile/user_address_list.dart';

class AddressInformation extends StatelessWidget {
  const AddressInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: "Address",
        tPosition: false,
        icon: FontAwesomeIcons.angleLeft,
        todo: () => Navigator.of(context).pop(),
      ),
      body: const UserAddressList(),
    );
  }
}
