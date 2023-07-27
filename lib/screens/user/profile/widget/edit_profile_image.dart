import "dart:developer";
import "dart:io";
import "package:cached_network_image/cached_network_image.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter/material.dart";
import "../../../../class/app_constant.dart";
import "../../../../class/model/user/user_model.dart";
import "../../../../package/functions/pick_image.dart";
import "../../../../package/size_config.dart";
import "../../../items/sub_items/stack_icon.dart";
import "../user_proflie_class/user_profile_class.dart";

class EditProfileImage extends StatefulWidget {
  const EditProfileImage(
      {super.key, required this.userModel, required this.pickedImage});

  final UserModel userModel;
  final Function pickedImage;

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  UserProfileClass uClass = UserProfileClass();
  UserModel get user => widget.userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        chooseImage(context, title: "Choose Profile Image").then((value) {
          uClass.image = value[0]!.path;
          uClass.isImagePicked = true;
          widget.pickedImage(uClass.image);
          setState(() {});
        });
      },
      child: SizedBox(
        height: getProportionateScreenHeight(130),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned.fill(
              child: Container(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenHeight(100),
                decoration: const ShapeDecoration(
                  shape: CircleBorder(
                    eccentricity: 0,
                    side: BorderSide(color: kDBlue),
                  ),
                ),
                child: Center(
                  child: user.image == null || user.image!.isEmpty
                      ? uClass.isImagePicked && uClass.image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(File(uClass.image)),
                            )
                          : const FaIcon(FontAwesomeIcons.user)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                              imageUrl: "$userProfileImage/${user.image!}")),
                ),
              ),

              // CircleAvatar(
              //   radius: 30,
              //   backgroundImage: user.image == null ||
              //           user.image!.isEmpty
              //       ? null
              //       : CachedNetworkImageProvider(user.image!),
              //   child: userProfileClass.isImagePicked
              //       ? ClipRRect(
              //           borderRadius: BorderRadius.circular(30),
              //           child: Image.file(
              //             File(image),
              //             fit: BoxFit.fitWidth,
              //           ),
              //         )
              //       : const SizedBox(),
              // ),
            ),
            StackCustomIcon(
              b: 0,
              r: getProportionateScreenWidth(125),
              onTap: () {},
              cardColor: kLight,
              icon: Icons.camera_alt_outlined,
            )
          ],
        ),
      ),
    );
  }
}
