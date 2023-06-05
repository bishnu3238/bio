import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../class/app_constant.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme.titleSmall;
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height - kToolbarHeight,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2874F0), Colors.indigoAccent],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(appName, style: stlH3(Colors.white)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Loading", style: theme!.copyWith(color: Colors.white)),
              const SizedBox(width: 10),
              const SpinKitSpinningCircle(color: Colors.white, size: 10),
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please Wait", style: TextStyle(color: Colors.white)),
                SizedBox(width: 10),
                SpinKitThreeBounce(color: Colors.white, size: 12),
              ],
            ),
          )
        ],
      ),
    );
  }
}
