import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/animation/page_indicatior.dart';

class ImageSliders extends StatelessWidget {
  final Function(dynamic) onTap;

  const ImageSliders({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (context, notifier, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: kToolbarHeight * 3,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                enlargeFactor: 0.3,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (ind, _) => notifier.pageIndicator = ind,
              ),
              items: bannerImages.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () => onTap(i),
                        child: Card(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(i, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
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
                    bannerImages.length,
                    (index) => PageIndicator(index: index),
                  ).toList(),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
