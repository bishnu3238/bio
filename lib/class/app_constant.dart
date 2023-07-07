import 'package:flutter/material.dart';

const appName = "BioCellar";
const appAddress = "372, Rabindra Sarani, Kolkata - 700006";

const appLogo = "assets/logo/toplesslogo.png";
const appIcon = "assets/logo/b.jpeg";
const emptyAddress = "assets/images/empty_address.jpg";

const gPayNumber = "+91 9231855554";
const gPayNumber2 = "9254166666";

const gPayName = "GPAY USER NAME";
const gPayName2 = "GPAY USER EDIT";

const upiID = "UPI ID:- abckefgh9976@sbi";
const upiID2 = "UPI ID:- abckefgh9976@okaxis";

const itemImgDir = "https://eazytechno.com/biocellar/admin/menu_image";
const itemMoreImageDir = "https://eazytechno.com/biocellar/admin/";
const brandImgDir = "https://eazytechno.com/biocellar/admin/category_images";
const categoryImgDir = "https://eazytechno.com/biocellar/admin/category_images";
const userProfileImage = "https://eazytechno.com/biocellar/user/user_img";
const bannerPath = "assets/images";
const brandLogoPath = "assets/brandlogo";

const kGrey = Color(0xFF757575);
const kR400 = Color(0xFFF51B45);
const kDark = Color(0xFF010A17);
const kGrey2 = Color(0xFF979797);
const kLight = Color(0xFFFDFFFE);
const kError = Color(0xFFFA1616);
const kDBlue = Color(0xFF010423);
const kLight2 = Color(0xFFF5F6F9);
const kIndigo = Color(0xFF526BFC);
const kOrange = Color(0xFFFF7643);
const kD2Dark = Color(0xff5e6172);
const kSuccess = Color(0xFF048D14);
const kPrimeColor = Color(0xFF2874F0);

kGradient(List<Color> colors) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colors,
    );

const kLayoutWidth = 375.0;
const kLayoutHeight = 812.0;

Widget gap(double gap, [int? i = 0]) {
  return i == 0 ? SizedBox(height: gap) : SizedBox(width: gap);
}

const emptyIcon = Icon(Icons.add, color: kLight);

const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);
Duration kDurationSCD([int? i = 2]) => Duration(seconds: i!);

kRoundRadius([double? radius = 10]) =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!));

const String rupee = "\u{20B9}";

// Form Error
final RegExp emailRegExp1 = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp emailRegExp2 =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

bool isEmailValid(String email) => emailRegExp2.hasMatch(email);

const List<String> bannerImages = [
  "$bannerPath/banner1.jpg",
  "$bannerPath/banner2.jpg",
  "$bannerPath/banner3.jpg",
  "$bannerPath/banner4.jpeg",
  "$bannerPath/banner5.jpg",
];

const dummyText =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,";
