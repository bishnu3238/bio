import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/model/http_services.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/cart/cart_screen.dart';
import '../../../class/app_constant.dart';
import '../../../class/model/cart/cart.dart';
import '../../../class/model/check_out_service/check_out_service.dart';
import '../../../class/model/product_master/items_model.dart';
import '../../../methods/cart_services.dart';
import '../../../package/custom_widgets/app_bars/app_bar.dart';
import '../../../package/custom_widgets/app_bars/sliver_appbar_delegate.dart';
import '../../../package/custom_widgets/buttons/custom_buttons.dart';
import '../../../package/custom_widgets/custom_image.dart';
import '../../../package/custom_widgets/user_icon.dart';
import '../../../package/size_config.dart';
import '../../home_page/bottom_nav_bar/bottom_nav_bar.dart';
import '../../home_page/sub_home_page/settings/sub_settings/setting_page_header.dart';
import '../../orders/check_out_screen.dart';
import '../sub_items/bulk_order.dart';
import '../sub_items/item_details_image_view.dart';
import '../sub_items/item_price.dart';
import '../sub_items/item_rating.dart';
import '../sub_items/item_reviews.dart';
import '../sub_items/product_details.dart';
import '../sub_items/selling_terms_show.dart';
import '../sub_items/show_brand_name.dart';
import '../sub_items/stack_icon.dart';
import '../../../class/master.dart';
import '../../../methods/static_methods.dart';
import '../../../package/custom_widgets/custom_rating_bar.dart';
import '../../../package/custom_widgets/divide.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../sub_items/view_similar.dart';

class ItemDetails extends StatefulWidget {
  final ItemModel item;
  const ItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool disableAddToCart = false;

  late Map? moreItemDetails;

  @override
  void initState() {
    super.initState();
    HttpServices.initialize(context);
    getMoreDetails();
  }

  Future getMoreDetails() async {
    moreItemDetails = {};
    moreItemDetails = (await HttpServices().getMoreProductDetails(widget.item));
    return moreItemDetails;
  }

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return Consumer<Cart>(
      builder: (ctx, product, _) {
        bool inHasCart = (product.findItemById(widget.item.id) != null);
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  floating: true,
                  snap: true,
                  flexibleSpace: AppAppBar(buttons: [UserIcon(isHome: false)]),
                ),
                FutureBuilder(
                    future: getMoreDetails(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData &&
                          (snapshot.data['images'] as List).isNotEmpty) {
                        return CustomSlivers(
                          moreItemDetails: snapshot.data,
                          item: widget.item,
                        );
                      } else if (snapshot.hasError) {
                        return CustomSliver(widget.item);
                      } else {
                        return CustomSliver(widget.item);
                      }
                    }),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          widget.item.name,
                          style: txStl(22, null, null),
                        ),
                        Text(
                          widget.item.sub_title,
                          maxLines: 1,
                          textAlign: TextAlign.justify,
                          style: stl1(15, Colors.grey.shade500, null)
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                        ShowBrandName(item: widget.item),
                        const SizedBox(height: 20),
                        ItemPrice(items: widget.item, size: 22),
                        const SizedBox(height: 20),
                        const Rows(
                          icon: FontAwesomeIcons.truckFast,
                          label: "Shipping charge will be applicable.",
                          widget: SizedBox(),
                        ),
                        const SizedBox(height: 20),
                        const SellingTermsShow(),
                        Divide(color: Colors.blue[50]!),
                        BulkOrder(widget.item),
                        ProductDetails(widget: widget),
                        const SizedBox(height: 25),
                        Divide(height: 15, color: Colors.grey[200]!),
                        const SizedBox(height: 20),
                        Rows(
                          title: Text(
                            "Review & Ratings",
                            style: stlight.copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          widget: const SizedBox(),
                        ),
                        // const Rows(label: "Review & Ratings"),
                        const SizedBox(height: 20),
                        ItemRating(item: widget.item),
                        const SizedBox(height: 20),
                        ItemReviews(item: widget.item),
                        const SizedBox(height: 25),
                        Divide(color: kPrimeColor.withOpacity(0.1)),
                        ViewSimilar(itemModel: widget.item),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Buttons(
                  text: inHasCart ? "Go to cart" : 'Add to cart',
                  onTap: () {
                    inHasCart
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const CartScreen()))
                        : context.read<Cart>().addToCart(widget.item, context);
                  },
                  color: kLight,
                )),
                Expanded(
                    child: Buttons(
                  text: 'Purchase now',
                  color: kPrimeColor,
                  onTap: () {
                    inHasCart
                        ? checkOut(context)
                        : CustomSnackBar.showToast("Cart is empty", kError);

                    // ctx.read<CheckOutService>().progressIndex =
                    //     (CheckOutStages.values.indexOf(CheckOutStages.Address));
                    //
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (ctx) => const CheckOutScreen()));
                    // // TODO: open checkOut page;
                  },
                ),),
              ],
            ),
          ],
          bottomNavigationBar: const BottomNavBar(isHome: false),
        );
      },
    );
  }
}

class MoreImages extends StatelessWidget {
  final Map moreItemDetails;

  const MoreImages({super.key, required this.moreItemDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(100),
      width: getProportionateScreenWidth(kLayoutWidth),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (moreItemDetails['images'] as List).length,
        itemBuilder: (ctx, index) {
          String path =
              "$itemImgDir/${moreItemDetails['images'][index]['image'].toString().split('.')[0]}/${moreItemDetails['images'][index]['image']}";

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: getProportionateScreenWidth(150),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    width: getProportionateScreenWidth(110),
                    height: getProportionateScreenHeight(60),
                    child: CustomImage(path),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

///
