import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/cart/cart_item.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/cart/cart_screen.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/options_card.dart';

import '../../../class/model/cart/cart.dart';
import '../../../class/model/product_master/shipping_model.dart';
import '../../../package/custom_painter/dashed_line_painter.dart';

class CartPriceDetails extends StatefulWidget {
  final List<CartItem> cartItem;
  const CartPriceDetails(this.cartItem, {Key? key}) : super(key: key);

  @override
  State<CartPriceDetails> createState() => _CartPriceDetailsState();
}

class _CartPriceDetailsState extends State<CartPriceDetails> {
  late List<ShippingModel> shippingCharges;

  @override
  void initState() {
    super.initState();
    Cart.initialize(context);
    shippingCharges = context.read<Provide>().shippingCharges;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (ctx, notify, _) {
        Cart.initialize(context);

        var cart = context.read<Cart>();
        var shippingCharge = cart.getProductShippingCharge(
            shippingCharges, num.parse(cart.totalAmount));
        return Visibility(
          visible: notify.showPriceDetails,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OptionsCard(elevation: 0, title: "Price Details", listOfWidget: [
                Rows(
                  label: 'MRP (${widget.cartItem.length} Items)',
                  widget: Text(
                    "\u{20B9} ${cart.totalItemPrice.replaceAll('.00', "")}",
                    style: stlH4.copyWith(color: kDBlue, fontSize: 15),
                  ),
                ),
                Rows(
                  label: 'Product Discount',
                  widget: Text(
                    " - \u{20B9} ${cart.totalItemDiscount}",
                    style: stlH4.copyWith(
                        fontSize: 13,
                        color: kDBlue,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Rows(
                  label: 'Delivery Fee',
                  widget: Text(
                    " + \u{20B9} $shippingCharge",
                    style: stlH4.copyWith(
                        fontSize: 13,
                        color: kIndigo,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                CustomPaint(
                  size: const Size(double.maxFinite, 10),
                  painter: DashedLinePainter(kDark, 5.0, 3.0),
                ),
                Rows(
                  label: 'Total',
                  widget: Text(
                    "\u{20B9} ${cart.finalAmount}",
                    style: navTxStl(null, kSuccess, FontWeight.bold),
                  ),
                ),
              ])
            ],
          ),
        );
      },
    );
  }
}
