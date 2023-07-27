import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/check_out_service/check_out_service.dart';
import '../../../methods/get_address_form_pincode.dart';
import '../../../package/custom_decorations/text_field_decoration/border_input_decoration.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';

class ShippingAddressBody extends StatefulWidget {
  const ShippingAddressBody({Key? key}) : super(key: key);

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  // final newAddressFromKey = GlobalKey<FormState>();
  final pincode = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final landMark = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    pincode.dispose();
    city.dispose();
    state.dispose();
    address.dispose();
    landMark.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutService>(builder: (context, checkOut, _) {
      return Visibility(
        visible: !checkOut.isShippAddSameAsPaymentAddress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const Rows(
                  label: 'Payment Address', widget: SizedBox(height: 50)),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: pincode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onChanged: (pincode) {
                        if (pincode.length == 6) addressFromPincode();
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      validator: (value) => value!.length < 6
                          ? 'please enter valid pincode'
                          : null,
                      decoration: borderInputDecoration(
                          context: context,
                          label: 'Pincode',
                          suffix: const Icon(Icons.auto_mode)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: city,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          value!.isEmpty ? 'please enter city name' : null,
                      decoration: borderInputDecoration(
                        context: context,
                        label: 'City',
                        suffix: const Icon(FontAwesomeIcons.city),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: state,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          value!.isEmpty ? 'please enter state name' : null,
                      decoration: borderInputDecoration(
                        context: context,
                        label: 'State',
                        suffix: const Icon(FontAwesomeIcons.magento),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: address,
                textInputAction: TextInputAction.next,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) =>
                    value!.isEmpty ? 'please enter full address' : null,
                decoration: borderInputDecoration(
                    context: context,
                    label: 'Full Address (Road name, Area, Colony) *'),
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: landMark,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: borderInputDecoration(
                    context: context, label: 'Landmark (Mall, Famous Shop)'),
              ),
            ],
          ),
        ),
      );
    });
  }

  addressFromPincode() async {
    await getAddressFromPincode(context, pincode.text).then((data) {
      if (data != null) {
        setState(() {
          state.text = data['PostOffice'][0]['State'];
          city.text = data['PostOffice'][0]['Division'];
        });
      }
    });
  }
}
