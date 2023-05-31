import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IntroBody extends StatelessWidget {
  final String? status;
  const IntroBody({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
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
          Text(
            "Bio Cellar",
            style:
                theme.titleLarge!.copyWith(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status ?? "",
                style: theme.titleSmall!.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 10),
              const SpinKitSpinningCircle(color: Colors.white, size: 10),
            ],
          )
        ],
      ),
    );
  }
}
