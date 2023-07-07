import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../size_config.dart';

class CustomImage extends StatelessWidget {
  final String img;
  final double? radius;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomImage(this.img,
      {Key? key,
      this.fit = BoxFit.fill,
      this.radius = 8,
      this.height = 100,
      this.width = double.maxFinite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: CachedNetworkImage(
        placeholder: (ctx, img) => Image.asset("assets/logo/b.jpeg"),
        // placeholderCacheWidth: getProportionateScreenWidth(width!).toInt(),
        imageUrl: img,
        fit: fit,
        height: getProportionateScreenHeight(height!),
        width: getProportionateScreenWidth(width!),
        errorWidget: (ctx, obj, trash) {
          return Image.asset(
            "assets/logo/b.jpeg",
            fit: BoxFit.cover,
            width: getProportionateScreenWidth(width!),
            height: getProportionateScreenHeight(height!),
          );
        },
      ),
    );
  }
}





class Pictures extends StatelessWidget {
  final String img;
  final double? radius;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const Pictures(this.img,
      {Key? key,
        this.fit = BoxFit.fill, this.radius, this.height, this.width,
   })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: CachedNetworkImage(
        placeholder: (ctx, img) => Image.asset("assets/logo/b.jpeg"),
        imageUrl: img,
        fit: fit,
        // height: getProportionateScreenHeight(height!),
        // width: getProportionateScreenWidth(width!),
        errorWidget: (ctx, obj, trash) {
          return Image.asset(
            "assets/logo/b.jpeg",
            fit: BoxFit.cover,
            // width: getProportionateScreenWidth(width!),
            // height: getProportionateScreenHeight(height!),
          );
        },
      ),
    );
  }
}
