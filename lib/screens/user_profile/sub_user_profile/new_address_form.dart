import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/methods/static_methods.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/custom_widgets/clear_focus.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../../../methods/get_address_form_pincode.dart';
import '../../../methods/save_address.dart';
import '../../../package/custom_widgets/buttons/custom_buttons.dart';
import '../../../package/zebook.dart';

class NewAddressForm extends StatefulWidget {
  const NewAddressForm({Key? key}) : super(key: key);

  @override
  State<NewAddressForm> createState() => _NewAddressFormState();
}

class _NewAddressFormState extends State<NewAddressForm> {
  final newAddressFromKey = GlobalKey<FormState>();
  final pincode = TextEditingController();
  final address = TextEditingController();
  final name = TextEditingController();
  final phoneNo = TextEditingController();
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
    name.dispose();
    phoneNo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(builder: (ctx, notify, _) {
      return ModalProgressHUD(
        inAsyncCall: notify.loading,
        progressIndicator: loadLoading(),
        child: ClearFocus(
          child: Scaffold(
            appBar: SimpleAppBar(
                todo: () => Navigator.of(context).pop(),
                title: 'Add Delivery Address',
                tPosition: false,
                icon: Icons.chevron_left),
            body: Consumer<AuthService>(
              builder: (BuildContext context, value, Widget? child) {
                var user = value.userModel;
                name.text = user.name;
                phoneNo.text = user.mobile_no;
                return ClearFocus(
                  child: SingleChildScrollView(
                    child: Form(
                      key: newAddressFromKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: name,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              validator: (value) => value!.isEmpty
                                  ? 'please enter your name'
                                  : null,
                              decoration: borderInputDecoration(
                                  context: context,
                                  label: 'Name *',
                                  prefix: const Icon(Icons.person)),
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              controller: phoneNo,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              textInputAction: TextInputAction.done,
                              validator: (value) => value!.length < 10
                                  ? 'please enter valid phone no'
                                  : null,
                              onEditingComplete: _saveAddress,
                              decoration: borderInputDecoration(
                                  context: context,
                                  label: 'Phone no. *',
                                  prefix:
                                      const Icon(Icons.phone_iphone_rounded)),
                            ),
                            const SizedBox(height: 30),

                            const Rows(
                                label: 'Payment Address',
                                widget: SizedBox(height: 50)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: pincode,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    onChanged: (pincode) {
                                      if (pincode.length == 6)
                                        addressFromPincode();
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(6)
                                    ],
                                    validator: (value) => value!.length < 6
                                        ? 'please enter valid pincode'
                                        : null,
                                    decoration: borderInputDecoration(
                                        context: context,
                                        label: 'Pincode',
                                        suffix: const Icon(Icons.auto_mode)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                FittedBox(
                                  child: Buttons(
                                    text: "Use current location",
                                    color: kOrange.withOpacity(0.9),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: city,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) => value!.isEmpty
                                        ? 'please enter city name'
                                        : null,
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
                                    validator: (value) => value!.isEmpty
                                        ? 'please enter state name'
                                        : null,
                                    decoration: borderInputDecoration(
                                      context: context,
                                      label: 'State',
                                      suffix:
                                          const Icon(FontAwesomeIcons.magento),
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
                              validator: (value) => value!.isEmpty
                                  ? 'please enter full address'
                                  : null,
                              decoration: borderInputDecoration(
                                  context: context,
                                  label:
                                      'Full Address (Road name, Area, Colony) *'),
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              controller: landMark,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: borderInputDecoration(
                                  context: context,
                                  label: 'Landmark (Mall, Famous Shop)'),
                            ),
                            // ShippingAddressBody(),
                            const SizedBox(height: 30),
                            Buttons(
                              size: MaterialStatePropertyAll(Size(
                                  getProportionateScreenWidth(360),
                                  getProportionateScreenHeight(50))),
                              text: 'Save Address',
                              color: kOrange.withOpacity(0.99),
                              onTap: _saveAddress,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }

  void _saveAddress() async {
    if (newAddressFromKey.currentState!.validate()) {
      // TODO: loading true
      context.read<Notifier>().loading = !context.read<Notifier>().loading;
      UserModel user = context.read<AuthService>().userModel;

      Map data = {
        'name': name.text,
        'delivery_add': address.text,
        'landmark': landMark.text,
        'state': state.text,
        'city': city.text,
        'pincode_id': pincode.text,
        'location_id': "",
        'user_id': user.id,
        'mobile_no': phoneNo.text,
        'date': currentDate(),
        'time': currentTime()
      };
      await saveAddress(context, data).whenComplete(() {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        pincode.clear();
        city.clear();
        state.clear();
        address.clear();
        landMark.clear();
        name.clear();
        phoneNo.clear();
        Future.delayed(
            const Duration(seconds: 1), () => Navigator.of(context).pop());
      });
    }
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
