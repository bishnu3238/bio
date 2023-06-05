import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/settings/sub_settings/setting_page_header.dart';

import '../../../package/custom_widgets/custom_add_remove_button.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';

class ItemDetails extends StatefulWidget {
  final ItemModel item;
  const ItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool disableAddToCart = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (ctx, product, _) {
        return Scaffold(
          appBar: AppAppBar(title: widget.item.name),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Hero(
                  tag: widget.item.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.item.image,
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(375),
                      height: getProportionateScreenHeight(412),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: BottomSheet(
            elevation: 5,
            constraints:
                BoxConstraints(maxHeight: getProportionateScreenHeight(450)),
            enableDrag: false,
            backgroundColor: Colors.lightBlue[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            onClosing: () {},
            builder: (ctx) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(375),
                        height: 20,
                        child: Center(
                          child: Container(
                            width: getProportionateScreenWidth(50),
                            height: getProportionateScreenHeight(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Rows(
                        label: widget.item.name,
                        textStyle: stlH3(),
                        widget: Text(
                          "\u{20B9} ${widget.item.price.roundToDouble()}",
                          style: navTxStl(
                              15, Colors.blueAccent[700], FontWeight.w700),
                        ),
                      ),
                      Rows(
                        label: "Rating : 4.5",
                        textStyle: stlH4,
                        widget: Consumer<Cart>(builder: (context, cart, _) {
                          bool have = cart.isThisItemHave(widget.item.id);
                          have
                              ? disableAddToCart = true
                              : disableAddToCart = false;
                          return have
                              ? CustomAddOrRemoveButtons(widget.item.id)
                              : const SizedBox();
                        }),
                      ),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Text(
                        dummyText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                                child: Buttons(
                              text: "Add to cart",
                              onTap: disableAddToCart ? null : () {},
                              color: Colors.white,
                            )),
                            Expanded(
                                child: Buttons(
                              text: "Order now",
                              onTap: () {},
                              color: kPrimeColor,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
