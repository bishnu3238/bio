import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/authentication/sub_authentication/term_policy.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';
import '../../../class/enums.dart';
import '../../../class/model/user/user_model.dart';
import '../../../package/custom_widgets/clear_focus.dart';
import '../../../package/custom_widgets/loading_screen.dart';
import '../../../package/zebook.dart';
import '../../home_page/sub_home_page/notification/notification.dart';
import '../../user_profile/sub_user_profile/profile_image.dart';
import '../../../package/custom_widgets/app_bars/simple_app_bar.dart';
import '../../../package/text_style.dart';
import 'edit_profile_information.dart';
import 'user_proflie_class/user_profile_class.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserProfileClass userprofile = UserProfileClass();

  final userProfileScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);
    return ClearFocus(
      child: Scaffold(
        key: userProfileScaffoldKey,
        drawer: const ProfileDrawer(),
        appBar: SimpleAppBar(
          tPosition: false,
          icon: FontAwesomeIcons.bars,
          title: "PROFILE INFORMATION",
          style: stlL.copyWith(fontSize: 13),
          todo: () => userProfileScaffoldKey.currentState!.openDrawer(),
          buttons: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: TextButton.icon(
                icon: const FaIcon(FontAwesomeIcons.penToSquare, size: 15),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              EditProfileInformation(userprofile)));
                },
                label: Text("Edit", style: txStl(15, kError, null)),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Consumer<AuthService>(builder: (context, user, _) {
              UserModel userModel = user.userModel;
              userprofile.initiateValues(user.userModel);
              return Column(
                children: [
                  ProfileImage(userModel),
                  TextFormField(
                    controller: userprofile.name,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    readOnly: true,
                    decoration: borderInputDecoration(
                        context: context,
                        label: "Full Name *",
                        borderColor: kLight,
                        suffix: emptyIcon),
                  ),
                  const SizedBox(height: 15),
                  ValueListenableBuilder<bool>(
                      valueListenable: userprofile.readOnly,
                      builder: (context, value, _) {
                        return TextFormField(
                          controller: userprofile.phone,
                          readOnly: value,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: borderInputDecoration(
                            context: context,
                            label: "Phone No. *",
                            borderColor: kLight,
                          ),
                        );
                      }),
                  const SizedBox(height: 25),
                  DropdownButtonFormField(
                    items: Gender.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.name,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2.0),
                              child: Text(e.name),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => userprofile.gender.text = value!,
                    borderRadius: BorderRadius.circular(10),
                    decoration: borderInputDecoration(
                        context: context, hint: 'Gender', borderColor: kLight),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: userprofile.email,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: borderInputDecoration(
                        context: context,
                        label: "Email Id",
                        borderColor: kLight),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  TextButton _buildTextButton(String text, VoidCallback onTap) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: txStl(14, kPrimeColor, FontWeight.w600),
        ));
  }
}

List<Map> profileDrawer = [
  {
    'icon': const FaIcon(FontAwesomeIcons.house, color: kPrimeColor),
    'label': const Text("Home"),
    'onTap': (context, Notifier? notify) {
      notify!.navIndex = 0;
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const HomePage()));
    },
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping, color: kPrimeColor),
    'label': const Text("My Orders"),
    'onTap': (BuildContext context, Notifier? notify) {
      notify!.navIndex = 2;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
        return const HomePage();
      }));
    },
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bell, color: kPrimeColor),
    'label': const Text("Notification"),
    'onTap': (context, Notifier? notify) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const Notifications())),
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.gears, color: kPrimeColor),
    'label': const Text("Setting"),
    'onTap': (context, Notifier? notify) {
      notify!.navIndex = 3;
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const HomePage()));
    },
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.h, color: kPrimeColor),
    'label': const Text("Help"),
    'onTap': (context, Notifier? notify) => CustomSnackBar.showToast(
        "This page is not created yet!",
        kError), // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
    //   context.read<Notifier>().navIndex = 3;
    //   return const HomePage();
    // })),
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.terminal, color: kPrimeColor),
    'label': const Text("Terms & Conditions"),
    'onTap': (context, Notifier? notify) =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
          return const Terms();
        })),
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.circleInfo, color: kPrimeColor),
    'label': const Text("About Us"),
    'onTap': (context, Notifier? notify) =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
          return const Terms(); // make About up
        })),
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.arrowRightFromBracket,
        color: kPrimeColor),
    'label': const Text("Log Out"),
    'onTap': (context, Notifier? notify) => Future.delayed(
          const Duration(milliseconds: 200),
          () {
            AuthService.initialize(context);
            context.read<AuthService>().signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const LoadingScreen(),
              ),
            );
          },
        ),
  }
];

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({
    super.key,
  });

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    var notify = context.read<Notifier>();
    return Drawer(
      child: ListView(
        children: [
          Container(height: 20, color: kLight),
          ...List.generate(
            profileDrawer.length,
            (index) => ListTile(
              tileColor: index.isEven ? kLight : kGrey.withOpacity(0.1),
              style: ListTileTheme.of(context).style,
              leading: profileDrawer[index]['icon'],
              title: profileDrawer[index]['label'],
              onTap: () => Future.delayed(const Duration(microseconds: 500),
                  () => profileDrawer[index]['onTap'](context, notify)),
            ),
          ).toList()
        ],
      ),
    );
  }
}
