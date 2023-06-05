import 'package:flutter/material.dart';

import '../../class/app_constant.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center
      (
      child: Column(
        children: [
          Image.asset("assets/images/empty_cart.png"),
          const Text("Empty !"),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(kPrimeColor)),
              onPressed: () {},
              child: const Text("Explore Our Products")),
        ],
      ),
    );
  }
}
