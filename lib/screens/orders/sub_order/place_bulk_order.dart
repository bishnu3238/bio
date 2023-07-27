import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/package/custom_widgets/clear_focus.dart';
import 'package:universal_lab/package/custom_widgets/loading_screen.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../../class/app_constant.dart';
import '../../../package/zebook.dart';
import '../class/place_bulk_order_class.dart';

class PlaceBulkOrder extends StatefulWidget {
  final ItemModel item;
  const PlaceBulkOrder(this.item, {Key? key}) : super(key: key);

  @override
  State<PlaceBulkOrder> createState() => _PlaceBulkOrderState();
}

class _PlaceBulkOrderState extends State<PlaceBulkOrder> {
  PlaceBulkOrderClass bulkOrder = PlaceBulkOrderClass();

  @override
  void dispose() {
    super.dispose();
    bulkOrder.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClearFocus(
      child: Scaffold(
        appBar: SimpleAppBar(
          title: 'Bulk Order',
          icon: Icons.arrow_back_ios,
          todo: () => Navigator.of(context).pop(),
        ),
        body: SafeArea(
          child: Consumer<AuthService>(builder: (context, auth, _) {
            UserModel user = auth.userModel;
            bulkOrder.init(user, widget.item);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: bulkOrder.placeOrderKey,
                  child: Column(
                    children: [
                      gap(30),
                      Text(
                        "For place order in bulk send request with message to the dealer.",
                        style: stlL.copyWith(fontSize: 20),
                      ),
                      gap(30),
                      TextFormField(
                        controller: bulkOrder.name,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            value!.isEmpty ? 'please enter your name' : null,
                        decoration: borderInputDecoration(
                            context: context, label: 'Full Name *'),
                      ),
                      gap(20),
                      TextFormField(
                        controller: bulkOrder.phone,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        validator: (value) => value!.length < 10
                            ? 'please enter valid phone no *'
                            : null,
                        decoration: borderInputDecoration(
                            context: context, label: 'Phone no *'),
                      ),
                      gap(20),
                      TextFormField(
                        controller: bulkOrder.item,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        readOnly: true,
                        decoration: borderInputDecoration(
                            context: context, label: 'Item Query'),
                      ),
                      gap(20),
                      TextFormField(
                        controller: bulkOrder.message,
                        maxLines: 4,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) => value!.isEmpty
                            ? 'please enter your message, for bulk order'
                            : null,
                        decoration: borderInputDecoration(
                            context: context, label: 'Message *'),
                      ),
                      gap(40),
                      Buttons(
                        text: 'Place Request',
                        onTap: () {
                          CustomSnackBar.initialize(context);
                          if (bulkOrder.placeOrderKey.currentState!
                              .validate()) {
                            submitBulkOrder();
                          } else {
                            CustomSnackBar.showSnackBar(
                                'Please fill request field details', kError);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  submitBulkOrder() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (crx) => LoadingScreen(
                  function: bulkOrder.submitBulkOrder,
                )));
  }
}
