import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/model/user/user_model.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/package/custom_widgets/custom_image.dart';
import '../../../class/app_constant.dart';
import '../../../package/text_style.dart';
import '../../../package/functions/pick_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../user/profile/user_proflie_class/user_profile_class.dart';

class ProfileImage extends StatefulWidget {
  final UserModel user;
  const ProfileImage(this.user, {Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    log(widget.user.image!.isEmpty.toString());
    log((widget.user.image == null).toString());
    log(widget.user.image.runtimeType.toString());
    return GestureDetector(
      onTap: () {
        // chooseImage(context, title: "Choose Profile Image").then((value) {
        //   userProfileClass.isImagePicked = true;
        //   setState(() {});
        // });
      },
      child: InkWell(
        onTap: () {
          CustomSnackBar.initialize(context);
          CustomSnackBar.showSnackBar(
              "Please tap edit button on top right corner",
              kDBlue.withOpacity(0.1));
        },
        child: Column(children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                widget.user.image == null || widget.user.image!.isEmpty
                    ? null
                    : CachedNetworkImageProvider(
                        "$userProfileImage/${widget.user.image!}"),
            child: widget.user.image == null || widget.user.image!.isEmpty
                ? const FaIcon(FontAwesomeIcons.solidUser)
                : const SizedBox(),
          ),
          const SizedBox(height: 20),
          Text(
            widget.user.image!.isEmpty ? "ADD PICTURE" : '',
            style: txStl(17, Colors.pinkAccent[400], FontWeight.w700),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
