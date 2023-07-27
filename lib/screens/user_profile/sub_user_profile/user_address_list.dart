import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../class/app_constant.dart';
import '../../../class/user_services/user_services.dart';
import '../../../package/custom_widgets/edit_text_button.dart';
import '../../../package/text_style.dart';
import 'add_new_address.dart';
import 'edit_user_address.dart';

class UserAddressList extends StatelessWidget {
  const UserAddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserServices>().address;
    return Column(
      children: [
        const
        AddNewAddress(label: "Add a new delivery address"),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: address.length,
            itemBuilder: (ctx, index) {
              var add = address[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    tileColor: kGrey.withOpacity(0.1),
                    title: Text(add.name,
                        style: stlT.copyWith(
                            fontSize: 25, fontWeight: FontWeight.normal)),
                    subtitle: AutoSizeText.rich(
                      style: stlight,
                      TextSpan(
                          style: stlight.copyWith(fontWeight: FontWeight.w600),
                          text: "${add.delivery_add} \n",
                          children: [
                            TextSpan(
                                style: stlight.copyWith(
                                    fontWeight: FontWeight.w100),
                                text:
                                    "${add.city} - ${add.pincode_id}, ${add.state} \n\n"),
                            TextSpan(
                                text: add.mobile_no,
                                style: stlight.copyWith(color: kPrimeColor))
                          ]),
                    ),
                    trailing: EditTextBtn(
                        callBack: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    EditUserAddress(address: address[index])))),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
