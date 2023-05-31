import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../package/custom_widgets/app_bars/app_bar.dart';
import 'sub_settings/options_card.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        title: "ACCOUNT",
        tPosition: false,
      ),
      body: Column(
        children: [
          DrawerHeader(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(""),
              ),
              title: Text("Bishnu Bhakat"),
              trailing: FaIcon(FontAwesomeIcons.arrowLeft),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          OptionsCard(
            title: "My Activity",
           listOfWidget: [
             Rows(icon: FontAwesomeIcons.penToSquare, label: "Review", widget: null),
             Rows(icon: FontAwesomeIcons.penToSquare, label: "Review", widget: null),
           ],
          )
        ],
      ),
    );
  }
}
