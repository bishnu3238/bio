import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/user_services/user_services.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';

import '../../../class/model/check_out_service/check_out_service.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../../user_profile/sub_user_profile/address_empty.dart';
import '../../user_profile/sub_user_profile/new_address_form.dart';
import 'selected_address.dart';
import 'selected_shipping_address.dart';

class UserAddresses extends StatelessWidget {
  const UserAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckOutService checkOut = context.watch<CheckOutService>();
    checkOut.paymentAddressId.log();
    return Consumer<UserServices>(
      builder: (ctx, user, _) {
        return user.address.isEmpty
            ? const AddressEmpty()
            : Column(
                children: [
                  Rows(
                      label: 'Payment Address',
                      widget: checkOut.paymentAddressId != "0"
                          ? TextButton(
                              onPressed: () {
                                checkOut.paymentAddressId = "0";
                              },
                              child: const Text('Change'),
                            )
                          : const SizedBox()),
                  gap(20),
                  const SelectedPaymentAddress(),
                  Rows(
                    // label: 'Shipping Address',

                    title: Consumer<CheckOutService>(
                        builder: (context, checkOut, _) {
                      return checkOut.paymentAddressId == '0'
                          ? const SizedBox()
                          : checkOut.isShippAddSameAsPaymentAddress
                              ? const Text("Shipping Address")
                              : Row(
                                  children: [
                                    const Text("Shipping Address"),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      const NewAddressForm()));
                                        },
                                        child: const Text("Add new")),
                                  ],
                                );
                    }),
                    widget: Consumer<CheckOutService>(
                      builder: (context, checkOut, _) {
                        return checkOut.paymentAddressId == '0'
                            ? const SizedBox()
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Same as above',
                                    style: stlH4.copyWith(fontSize: 12),
                                  ),
                                  Checkbox(
                                    value:
                                        checkOut.isShippAddSameAsPaymentAddress,
                                    onChanged: (value) {
                                      checkOut.isShippAddSameAsPaymentAddress =
                                          value!;
                                      value
                                          ? checkOut.deliveryAddressId =
                                              checkOut.paymentAddressId
                                          : checkOut.deliveryAddressId = '0';
                                    },
                                  ),
                                ],
                              );
                      },
                    ),
                  ),
                  Consumer<CheckOutService>(builder: (context, checkOut, _) {
                    return checkOut.paymentAddressId == '0'
                        ? const SizedBox()
                        : const SelectedShippingAddress();
                  })
                ],
              );
      },
    );
  }
}
