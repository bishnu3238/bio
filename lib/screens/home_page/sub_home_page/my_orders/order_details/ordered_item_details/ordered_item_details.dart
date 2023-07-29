import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/model/order/order_item_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:provider/provider.dart';
import '../../../../../../class/model/product_master/items_model.dart';
import '../../../../../../package/custom_widgets/custom_image.dart';
import '../../../../../../package/custom_widgets/custom_rating_bar.dart';
import '../../../../../reviews/submit_review.dart';

class OrderedItemDetails extends StatelessWidget {
  final OrderItemModel orderItem;
  const OrderedItemDetails(this.orderItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(
          icon: FontAwesomeIcons.angleLeft,
          todo: () => Navigator.of(context).pop(),
          title: orderItem.productName,
          buttons: const [UserIcon(isHome: false)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomImage(orderItem.getImage(context),
                  height: getProportionateScreenHeight(400)),
              Center(
                child: Text(orderItem.productName),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          Container(
            width: double.infinity,
            child: Buttons(
              text: 'Give Review & Feed back',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SubmitReview()));
              },
            ),
          )
        ]);
  }

  openReviewSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: RatingBar.builder(
                  itemCount: 5,
                  minRating: 0.5,
                  itemSize: 50,
                  updateOnDrag: false,
                  initialRating: 0.0,
                  glow: false,
                  direction: Axis.horizontal,
                  wrapAlignment: WrapAlignment.start,
                  onRatingUpdate: (_) {
                    setState.call(() {});
                  },
                  ignoreGestures: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                  itemBuilder: (context, _) => FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow.shade700),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}

extension GetImage on OrderItemModel {
  String getImage(BuildContext context) {
    return context
        .read<Provide>()
        .items
        .firstWhere((element) => element.id == productId)
        .image;
  }
}

extension GetItemModel on OrderItemModel {
  ItemModel toItemModel(BuildContext context) {
    ItemModel item = context
        .read<Provide>()
        .items
        .singleWhere((element) => element.id == productId);

    return item;
  }
}
