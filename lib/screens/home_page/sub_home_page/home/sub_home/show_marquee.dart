import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../../../../../class/app_constant.dart';
import '../../../../../class/model/http_services.dart';
import '../../../../../class/model/provider.dart';
import '../../../../../package/size_config.dart';
import '../../../../../package/text_style.dart';

class ShowMarquee extends StatelessWidget {
  const ShowMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Provide>(
      builder: (context, provide, _) {
        return provide.marquee.isEmpty
            ? const SizedBox()
            : FutureBuilder(
                future: provide.marquee.isEmpty
                    ? HttpServices().getMarquee()
                    : Future.value("0"),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: getProportionateScreenHeight(35),
                      width: getProportionateScreenWidth(360),
                      child: Marquee(
                        text: provide.marquee.map((e) => e.name).join(', '),
                        style: stlT.copyWith(color:kDark),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 20.0,
                        velocity: 50.0,
                        pauseAfterRound: kAnimationDuration,
                        startPadding: 10.0,
                        accelerationDuration:  const Duration(milliseconds: 500),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.ease,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const SizedBox.shrink();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
      },
    );
  }
}
