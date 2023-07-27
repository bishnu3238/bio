import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/check_out_service/check_out_service.dart';
import 'package:universal_lab/screens/user_profile/sub_user_profile/address_list.dart';

import '../../../class/app_constant.dart';
import '../../../class/model/user/user_address.dart';
import '../../../class/user_services/user_services.dart';
import '../../../package/text_style.dart';

class SelectedPaymentAddress extends StatelessWidget {
  const SelectedPaymentAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutService>(builder: (ctx, checkOut, _) {
      return checkOut.paymentAddressId != '0'
          ? SelectedAddressDetails(checkOut.paymentAddressId)
          : AddressList(callback: (String id) {
              checkOut.paymentAddressId = id;

              if (checkOut.isShippAddSameAsPaymentAddress) {
                checkOut.deliveryAddressId = checkOut.paymentAddressId;
              }
            });
    });
  }
}

class SelectedAddressDetails extends StatelessWidget {
  final String paymentAddressId;
  const SelectedAddressDetails(this.paymentAddressId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserServices>(builder: (ctx, user, _) {
      Address? address = user.addressFromId(paymentAddressId);
      return ListTile(
        title: Text(address.name,
            style: stlT.copyWith(fontSize: 25, fontWeight: FontWeight.normal)),
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
              ]),
        ),
        // secondary: InkWell(
        //     onTap: () {},
        //     child: Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        //         decoration: BoxDecoration(
        //             border: Border.all(),
        //             boxShadow: [
        //               BoxShadow(blurRadius: 0.1, color: kError.withOpacity(0.1))
        //             ],
        //             borderRadius: BorderRadius.circular(5)),
        //         child: const Text('Edit'))),
        //subtitle: AutoSizeText(),
      );
    });
  }
}
