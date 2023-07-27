import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/check_out_service/check_out_service.dart';
import 'package:universal_lab/screens/user_profile/sub_user_profile/address_list.dart';

import '../../../class/app_constant.dart';
import '../../../class/model/user/user_address.dart';
import '../../../class/user_services/user_services.dart';
import '../../../package/text_style.dart';
import 'address_body.dart';

class SelectedShippingAddress extends StatelessWidget {
  const SelectedShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutService>(builder: (ctx, checkOut, _) {
      return checkOut.deliveryAddressId != '0'
          ? SelectedShippingAddressDetails(checkOut.deliveryAddressId)
          : AddressList(callback: (String id) {
              checkOut.deliveryAddressId = id;

              if(checkOut.paymentAddressId == id){
                return;
              }
              checkOut.isShippAddSameAsPaymentAddress = false;

            });
    });
  }
}

class SelectedShippingAddressDetails extends StatelessWidget {
  final String deliveryAddressId;
  const SelectedShippingAddressDetails(this.deliveryAddressId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserServices>(
      builder: (ctx, user, _) {
        Address? address = user.addressFromId(deliveryAddressId);
        return ListTile(
          title: Text(address.name,
              style:
                  stlT.copyWith(fontSize: 25, fontWeight: FontWeight.normal)),
          subtitle: AutoSizeText.rich(
            style: stlight,
            TextSpan(
              style: stlight.copyWith(fontWeight: FontWeight.w600),
              text: "${address.delivery_add} \n",
              children: [
                TextSpan(
                    style: stlight.copyWith(fontWeight: FontWeight.w100),
                    text:
                        "${address.city} - ${address.pincode_id}, ${address.state} \n\n"),
                TextSpan(
                    text: address.mobile_no,
                    style: stlight.copyWith(color: kPrimeColor))
              ],
            ),
          ),
        );
      },
    );
  }
}
