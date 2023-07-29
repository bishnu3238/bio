import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../class/app_constant.dart';
import '../../../../package/text_style.dart';


class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     AutoSizeText.rich(

      style: stlH5.copyWith(fontSize: 25),

      TextSpan(

        text: 'Create an account \n',

        children: [

          const TextSpan(text: 'with '),

          TextSpan(

            text: 'Biocaller',

            style: stlH5.copyWith(fontSize: 25, color: kPrimeColor),

          )

        ],

      ),

    );
  }
}
