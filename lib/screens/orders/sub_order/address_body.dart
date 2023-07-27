// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import '../../../class/model/check_out_service/check_out_service.dart';
import '../../../class/user_services/auth_service.dart';
import '../../../class/user_services/user_services.dart';
import '../../../package/custom_widgets/edit_text_button.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../../user_profile/sub_user_profile/add_new_address.dart';
import '../../user_profile/sub_user_profile/address_empty.dart';
import '../../user_profile/sub_user_profile/address_list.dart';
import '../../user_profile/sub_user_profile/new_address_form.dart';
import 'selected_address.dart';
import 'selected_shipping_address.dart';
import 'user_addresses.dart';

enum AddressTypes { Payment, Shipping }

class AddressBody extends StatefulWidget {
  const AddressBody({super.key});

  @override
  State<AddressBody> createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> {
  @override
  void initState() {
    super.initState();
    context.read<UserServices>().callAddressApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AddNewAddress(label: "Add a new delivery address"),
          UserAddresses(),
        ],
      ),
    );
  }
}
