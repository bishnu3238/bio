import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/package/text_style.dart';

import '../../../class/app_constant.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';
import 'new_address_form.dart';

class AddNewAddress extends StatelessWidget {
  final String label;
  const AddNewAddress({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => const NewAddressForm()));
      },
      child: OptionsCard(
        listOfWidget: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Rows(
              icon: FontAwesomeIcons.plus,
              label: label,
              textStyle: txStl(15, kPrimeColor, null),
            ),
          )
        ],
      ),
    );
  }
}
