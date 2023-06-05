import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/model/cart/cart_item.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/setting_page_header.dart';
import '../animation/animation_switcher.dart';

class CustomAddOrRemoveButtons extends StatefulWidget {
  final String itemId;
  const CustomAddOrRemoveButtons(this.itemId, {Key? key}) : super(key: key);

  @override
  State<CustomAddOrRemoveButtons> createState() =>
      _CustomAddOrRemoveButtonsState();
}

class _CustomAddOrRemoveButtonsState extends State<CustomAddOrRemoveButtons> {
  late ItemModel item;
  bool showAddToCart = false;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    item = context
        .read<Provide>()
        .items
        .firstWhere((element) => element.id == widget.itemId);

    return Consumer<Cart>(
      builder: (context, cart, _) {
        CartItem? cartItem = cart.findItemById(widget.itemId);
        cartItem == null ? showAddToCart = true : quantity = cartItem.quantity;

        return showAddToCart
            ? Buttons(
                text: "Add to cart",
                onTap: () {
                  cart.addToCart(item);
                  setState(() => showAddToCart = false);
                })
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () => cart.decrementQuantity(widget.itemId),
                      icon: const FaIcon(
                        FontAwesomeIcons.minus,
                        color: Color(0xFFEC6813),
                      ),
                    ),
                    AnimatedSwitcherWrapper(
                      child: Text(
                        "${cartItem!.quantity}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () => cart.incrementQuantity(widget.itemId),
                      icon: const FaIcon(FontAwesomeIcons.plus,
                          color: Color(0xFFEC6813)),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () => cart.removeFromCart(widget.itemId),
                      icon: const FaIcon(FontAwesomeIcons.trashCan,
                          color: Color(0xFFEC6813)),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
