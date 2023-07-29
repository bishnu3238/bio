import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/custom_widgets/buttons/custom_buttons.dart';
import 'package:universal_lab/package/custom_widgets/user_icon.dart';
import 'package:universal_lab/package/text_style.dart';
import 'package:universal_lab/screens/my_points/my_points_class.dart';

import '../../package/size_config.dart';

class MyPoints extends StatelessWidget {
  const MyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: "My Points",
        tPosition: false,
        buttons: [UserIcon(isHome: false,)],
      ),
      body: Consumer<MyPointsClass>(builder: (context, points, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(300),
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/points_bg.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            points.points.toString(),
                            style:
                                GoogleFonts.b612(fontSize: 50, color: kLight),
                          ),
                          Text(
                            'Available points',
                            style: txStl(15, kLight.withOpacity(0.9), null),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(),
              Container(
                height: getProportionateScreenHeight(200),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: kPrimeColor.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(25)),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '$rupee 1 Rewards',
                        style: GoogleFonts.asar(
                            fontSize: 30,
                            color: Colors.teal,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'for every One Point',
                        textAlign: TextAlign.center,
                        style: txStl(15, kDark.withOpacity(0.9), null),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Buttons(
                  color: kDBlue,
                  onTap: () {},
                  text: "Redeem",
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
