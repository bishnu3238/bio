import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/methods/static_methods.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import 'package:universal_lab/screens/items/sub_items/stack_icon.dart';

import '../../../../../class/app_constant.dart';
import '../../../../../class/user_services/auth_service.dart';
import '../../../../../package/custom_widgets/buttons/custom_buttons.dart';
import '../../../../../package/custom_widgets/divide.dart';
import '../../../../../package/size_config.dart';
import '../../../../user_profile/address_information.dart';
import '../../../../user/profile/user_profile.dart';
import '../../notification/notification.dart';
import 'setting_page_header.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, auth, _) {
        return Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              onTap: () {},
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              leading: SizedBox(
                width: getProportionateScreenWidth(60),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned.fill(
                      child: CircleAvatar(
                        radius: 30,
                        child: auth.userModel.image == null ||
                                auth.userModel.image!.isEmpty
                            ? const Icon(FontAwesomeIcons.user)
                            : CustomImage(
                                "$userProfileImage/${auth.userModel.image!}",
                                radius: 25),
                      ),
                    ),
                    StackCustomIcon(
                      b: 0,
                      r: 0,
                      onTap: () {},
                      cardColor: kLight,
                      icon: Icons.camera_alt_outlined,
                    )
                  ],
                ),
              ),
              title: Text(auth.userModel.name),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.angleRight,
                    color: kDBlue,
                  )),
            ),
            const Divide(color: Colors.white30),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.addressBook,
                          text: "Address",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddressInformation()));
                          },
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.user,
                          text: "Profile",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserProfile()));
                          },
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.list,
                          text: "Notification",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const Notifications()));
                          },
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ButtonsIcon(
                          icon: FontAwesomeIcons.solidMoneyBill1,
                          text: "Coupons",
                          onTap: () {},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        );
      },
    );
  }
}
