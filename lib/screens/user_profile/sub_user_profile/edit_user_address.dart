import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/custom_widgets/clear_focus.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../../../class/model/user/user_address.dart';
import '../../../package/custom_widgets/buttons/custom_buttons.dart';
import '../../../package/zebook.dart';
import '../class/edit_adderss_class.dart';

class EditUserAddress extends StatefulWidget {
  final Address address;
  const EditUserAddress({Key? key, required this.address}) : super(key: key);

  @override
  State<EditUserAddress> createState() => _EditUserAddressState();
}

class _EditUserAddressState extends State<EditUserAddress> {
  Address get address => widget.address;
  EditAddressClass add = EditAddressClass();

  @override
  Widget build(BuildContext context) {
    add.inti(address);
    return Consumer<Notifier>(
      builder: (context, notify, _) {
        return ModalProgressHUD(
          inAsyncCall: notify.loading,
          progressIndicator: loadLoading(),
          child: ClearFocus(
            child: Scaffold(
              appBar: SimpleAppBar(
                  todo: () => Navigator.of(context).pop(),
                  title: 'Edit Address',
                  tPosition: false,
                  icon: Icons.chevron_left),
              body: ClearFocus(
                child: SingleChildScrollView(
                  child: Form(
                    key: add.editAddressFromKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Column(
                        children: [

                          const SizedBox(height: 30),
                          TextFormField(
                            controller: add.name,
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
                            controller: add.phoneNo,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            textInputAction: TextInputAction.done,
                            validator: (value) => value!.length < 10
                                ? 'please enter valid phone no'
                                : null,
                            onEditingComplete: _editAddress,
                            decoration: borderInputDecoration(
                                context: context,
                                label: 'Phone no. *',
                                prefix: const Icon(Icons.phone_iphone_rounded)),
                          ),
                          const SizedBox(height: 30),

                          const Rows(
                              label: 'Payment Address',
                              widget: SizedBox(height: 50)),
                          TextFormField(
                            controller: add.pincode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (pincode) {
                              // if (pincode.length == 6) addressFromPincode();
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
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: add.city,
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
                                  controller: add.state,
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
                            controller: add.address,
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
                            controller: add.landMark,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: borderInputDecoration(
                                context: context,
                                label: 'Landmark (Mall, Famous Shop)'),
                          ),
                          // ShippingAddressBody(),
                          Buttons(
                            size: MaterialStatePropertyAll(Size(
                                getProportionateScreenWidth(360),
                                getProportionateScreenHeight(50))),
                            text: 'Edit Address',
                            color: kError.withOpacity(0.99),
                            onTap: _editAddress,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _editAddress() async {
    await add.editAddress(address, context).whenComplete(() {
      Navigator.of(context).pop();

      return context.read<Notifier>().loading = false;
    });
    print(add.toString());
  }
}
