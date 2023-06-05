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
      child: FadeInImage.assetNetwork(
        placeholder: "assets/logo/b.jpeg",
        placeholderCacheWidth: width!.toInt(),

        image: img,
        fit: fit,
        height: getProportionateScreenHeight(height!),
        width: width,
        imageErrorBuilder: (ctx, obj, trash) {
          return Image.asset(
            "assets/logo/b.jpeg",
            fit: BoxFit.cover,
            width: width!,
            height: getProportionateScreenHeight(height!),
          );
        },
      ),
    );
  }
}
