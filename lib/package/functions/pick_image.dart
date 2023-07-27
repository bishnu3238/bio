import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../class/app_constant.dart';
import '../text_style.dart';

Future<List<XFile?>> chooseImage(BuildContext context,
    {required String title, bool? multi = false}) async {
  List<XFile?> images = [];
  final imageSource = await showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: stl1(18, kDBlue, FontWeight.bold),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Take a picture',
              style: stlBtn(),
            ),
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          CupertinoDialogAction(
            child: Text(
              'Choose from gallery',
              style: stlBtn(),
            ),
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
          ),
        ],
      );
    },
  );
  if (imageSource == null) {
    return [];
  } else if (imageSource == ImageSource.camera) {
    images = await openCamera();
  } else if (imageSource == ImageSource.gallery && multi!) {
    images = await openGalleryMulti();
  } else {
    images = await openGallery();
  }
  return images;
}

Future<List<XFile?>> openCamera() async {
  return await ImagePicker()
      .pickImage(source: ImageSource.camera)
      .then((value) => [value!])
      .catchError((err) => throw Exception(err.toString()));
}

Future<List<XFile?>> openGalleryMulti() async {
  return await ImagePicker()
      .pickImage(source: ImageSource.gallery)
      .then((value) => [value!])
      .catchError((err) => throw Exception(err.toString()));
}

Future<List<XFile?>> openGallery() async {
  return await ImagePicker()
      .pickMultiImage()
      .then((value) => value)
      .catchError((err) => throw Exception(err.toString()));
}
