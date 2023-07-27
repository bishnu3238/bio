import "dart:developer";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";
import "package:provider/provider.dart";
import "package:universal_lab/class/user_services/auth_service.dart";
import "package:universal_lab/screens/user/profile/user_proflie_class/user_profile_class.dart";

import "../../../class/app_constant.dart";
import "../../../class/database/db.dart";
import "../../../class/enums.dart";
import "../../../class/model/user/user_model.dart";
import "../../../class/widget_lavel_provider/notifier.dart";
import "../../../package/custom_decorations/text_field_decoration/border_input_decoration.dart";
import "../../../package/custom_widgets/app_bars/simple_app_bar.dart";
import "../../../package/custom_widgets/buttons/custom_buttons.dart";
import "../../../package/custom_widgets/clear_focus.dart";
import "../../../package/custom_widgets/loading_screen.dart";
import "../../../package/size_config.dart";
import "../../../package/text_style.dart";
import "../../items/sub_items/stack_icon.dart";
import "widget/edit_profile_image.dart";

class EditProfileInformation extends StatefulWidget {
  final UserProfileClass userprofile;
  const EditProfileInformation(this.userprofile, {Key? key}) : super(key: key);

  @override
  State<EditProfileInformation> createState() => _EditProfileInformationState();
}

class _EditProfileInformationState extends State<EditProfileInformation> {
  UserProfileClass get userProfile => widget.userprofile;
  late UserModel userModel;

  @override
  void initState() {
    super.initState();
    log("hello");
    userModel = context.read<AuthService>().userModel;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Notifier, AuthService>(
        builder: (context, notify, user, _) {
      return ModalProgressHUD(
        inAsyncCall: notify.loading,
        progressIndicator: loadLoading(),
        child: ClearFocus(
          child: Scaffold(
            appBar: SimpleAppBar(
                todo: () => Navigator.of(context).pop(),
                title: 'EDIT PROFILE INFORMATION',
                style: stlL.copyWith(fontSize: 13),
                tPosition: false,
                icon: Icons.chevron_left),
            body: SingleChildScrollView(
              child: Form(
                key: userProfile.editProfileFormKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      EditProfileImage(
                          userModel: user.userModel,
                          pickedImage: (image) => setState(() =>
                              userModel = userModel.copyWith(image: image))),
                      const SizedBox(height: 35),
                      TextFormField(
                        controller: userProfile.name,
                        textInputAction: TextInputAction.next,
                        onChanged: (name) {
                          userModel = userModel.copyWith(name: name);
                          setState(() {});
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'please enter your name *' : null,
                        decoration: borderInputDecoration(
                          context: context,
                          label: 'Full Name',
                          prefix: const Icon(FontAwesomeIcons.user),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: userProfile.phone,
                        textInputAction: TextInputAction.next,
                        validator: (value) => value!.isEmpty
                            ? 'please enter phone number *'
                            : null,
                        onChanged: (mobile) {
                          userModel = userModel.copyWith(mobile_no: mobile);
                          setState(() {});
                        },
                        decoration: borderInputDecoration(
                          context: context,
                          label: 'Phone Number',
                          prefix: const Icon(FontAwesomeIcons.mobile),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: userProfile.email,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (email) {
                          userModel = userModel.copyWith(email: email);
                          setState(() {});
                        },
                        decoration: borderInputDecoration(
                          context: context,
                          label: 'Email Id (Optional)',
                          prefix: const Icon(FontAwesomeIcons.solidEnvelope),
                        ),
                      ),
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
                        onChanged: (value) {
                          userModel = userModel.copyWith(gender: value!);
                          userProfile.gender.text = value;
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(10),
                        decoration: borderInputDecoration(
                          context: context,
                          hint: 'Gender',
                          borderColor: kLight,
                          prefix: const Icon(FontAwesomeIcons.person),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Buttons(
                        size: MaterialStatePropertyAll(Size(
                            getProportionateScreenWidth(360),
                            getProportionateScreenHeight(50))),
                        text: 'Update',
                        color: kOrange.withOpacity(0.99),
                        onTap: userModel == user.userModel
                            ? null
                            : () async {
                                await widget.userprofile
                                    .updateUserProfile(user.userModel, context)
                                    .then((_) {
                                  Navigator.of(context).pop();
                                });
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
