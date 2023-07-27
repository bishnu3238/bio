import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/screens/items/sub_items/stack_icon.dart';
import '../../../class/model/product_master/items_model.dart';
import '../../../package/custom_widgets/app_bars/sliver_appbar_delegate.dart';
import '../../../package/custom_widgets/custom_image.dart';
import '../../../package/custom_widgets/image_slider.dart';
import '../../../package/size_config.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import '../../../package/animation/page_indicatior.dart';

class CustomSliver extends StatelessWidget {
  final ItemModel item;
  // final Map? moreItemDetails;
  const CustomSliver(this.item, {super.key});
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        minHeight: kToolbarHeight,
        maxHeight: getProportionateScreenWidth(450),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: kLight,
                child: CustomImage(
                  radius: 0,
                  item.image,
                  height: 450,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            // StackHeartIcon(favoriteToggle: () {}),
            // StackCustomIcon(
            //   onTap: () {},
            //   icon: FontAwesomeIcons.shareNodes,
            //   size: 20,
            //   t: 40,
            //   r: 7,
            // )
            ///
            // Positioned(
            //   bottom: -10,
            //   child:,
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomSlivers extends StatefulWidget {
  final ItemModel item;
  final Map moreItemDetails;
  const CustomSlivers({
    Key? key,
    required this.item,
    required this.moreItemDetails,
  }) : super(key: key);

  @override
  State<CustomSlivers> createState() => _CustomSliversState();
}

class _CustomSliversState extends State<CustomSlivers> {
  final _pageController = PageController();

  late List<ImageProvider> _imageProviders;

  late MultiImageProvider _easyEmbeddedImageProvider;
  @override
  void initState() {
    super.initState();

    _imageProviders = List.generate(
        (widget.moreItemDetails['images'] as List).length,
        (index) => Image.network(
                "$itemImgDir/${widget.moreItemDetails['images'][index]['image'].toString().split('.')[0]}/${widget.moreItemDetails['images'][index]['image']}")
            .image)
      ..insert(0, Image.network(widget.item.image).image);
    // [widget.item.image, ...widget.moreItemDetails['images']];
    _easyEmbeddedImageProvider = MultiImageProvider(_imageProviders);
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        minHeight: kToolbarHeight,
        maxHeight: getProportionateScreenWidth(450),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.0,
              child: Consumer<Notifier>(
                builder: (context, notify, child) {
                  return EasyImageViewPager(
                    doubleTapZoomable: true,
                    easyImageProvider: _easyEmbeddedImageProvider,
                    pageController: _pageController,


                  );
                },
              ),
            ),
            Positioned(
              bottom: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: List.generate(
                    _imageProviders.length,
                    (index) => ItemImageIndicator(index: index),
                  ).toList(),
                ),
              ),
            )
          ],
        ),
        // SizedBox(
        //   height: getProportionateScreenHeight(100),
        //   width: getProportionateScreenWidth(kLayoutWidth),
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: (widget.moreItemDetails['images'] as List).length,
        //     itemBuilder: (ctx, index) {
        //       String path =
        //           "$itemImgDir/${widget.moreItemDetails['images'][index]['image'].toString().split('.')[0]}/${widget.moreItemDetails['images'][index]['image']}";
        //
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: InkWell(
        //           onTap: () {},
        //           child: SizedBox(
        //             width: getProportionateScreenWidth(kLayoutWidth - 10),
        //             child: Card(
        //                 elevation: 4,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(12)),
        //                 child: SizedBox(
        //                   width: getProportionateScreenWidth(110),
        //                   height: getProportionateScreenHeight(60),
        //                 child:  CustomImage(path),
        //                 ),
        //                 ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
