import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/check_out_service/check_out_service.dart';
import 'package:universal_lab/class/model/user/user_address.dart';
import 'package:universal_lab/screens/orders/sub_order/address_body.dart';
import '';
import '../../../package/custom_widgets/edit_text_button.dart';
import '../../../package/text_style.dart';
import 'edit_user_address.dart';

class AddressTile extends StatefulWidget {
  final Address address;
  final Function(String) callback;
  const AddressTile(this.address, {Key? key, required this.callback})
      : super(key: key);

  @override
  State<AddressTile> createState() => _AddressTileState();
}

class _AddressTileState extends State<AddressTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutService>(builder: (context, checkOut, _) {
      return RadioListTile(
        activeColor: kPrimeColor,
        value: widget.address.id,
        groupValue: checkOut.paymentAddressId,
        onChanged: (String? value) {
          widget.callback(widget.address.id);
          // setState(() {
          //   widget.type == AddressTypes.Payment
          //       ? checkOut.paymentAddressId = value!
          //       : checkOut.isShippAddSameAsPaymentAddress
          //           ? checkOut.deliveryAddressId = value!
          //           : checkOut.deliveryAddressId = '0';
          // });
        },
        title: Text(widget.address.name,
            style: stlT.copyWith(fontSize: 20, fontWeight: FontWeight.normal)),
        subtitle: AutoSizeText.rich(
          style: stlight,
          TextSpan(
              style: stlight.copyWith(fontWeight: FontWeight.w600),
              text: "${widget.address.delivery_add} \n",
              children: [
                TextSpan(
                    style: stlight.copyWith(fontWeight: FontWeight.w100),
                    text:
                        "${widget.address.city} - ${widget.address.pincode_id}, ${widget.address.state} \n\n"),
                TextSpan(
                    text: widget.address.mobile_no,
                    style: stlight.copyWith(color: kPrimeColor))
              ]),
        ),
        secondary: EditTextBtn(
            callBack: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) =>
                        EditUserAddress(address: widget.address)))),
      );
    });
  }
}
