import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/cart.dart';
import 'package:universal_lab/class/model/product_master/items_model.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/custom_widgets/divide.dart';
import 'package:universal_lab/package/loading_button.dart';
import 'package:universal_lab/package/size_config.dart';

import '../../package/text_style.dart';

class ItemDetails extends StatelessWidget {
  final ItemModel item;
  const ItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: item.name),
      body: Consumer(builder: (ctx, product, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: item.name,
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(375),
                      height: getProportionateScreenHeight(412),
                    )),
                const SizedBox(height: 15),
                Text(item.name,
                    maxLines: 1, style: stlH3, overflow: TextOverflow.fade),
                Text(item.description,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                Text(
                  "\u{20B9} ${item.price.roundToDouble()}",
                  style: stlH4,
                ),
                const Text("Rating: 4.5"),
                const SizedBox(height: 10),
                const Divide(color: Colors.white54),
              ],
            ),
          ),
        );
      }),
      bottomSheet: Container(
        width: double.maxFinite,
        height: getProportionateScreenHeight(100),
        padding: const EdgeInsets.all(8),
        child: Consumer<Cart>(
          builder: (context, cart,_) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: LoadingButton(
                  text: "Add to cart",
                  onPressed: () => cart.addCartItem(item, 1),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: LoadingButton(
                  text: "Purchase",
                  onPressed: () {},
                  color: Colors.redAccent.shade700,
                )),
              ],
            );
          }
        ),
      ),
    );
  }
}
