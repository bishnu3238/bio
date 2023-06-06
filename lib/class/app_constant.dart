import 'package:flutter/material.dart';

const appName = "BioCellar";

const bannerPath = "assets/images";
const brandLogoPath = "assets/brandlogo";

const kText = Color(0xFF757575);
const kBlue = Color(0xFF010A17);
const kLight = Color(0xFFFFECDF);
const kGrey2 = Color(0xFF979797);
const kOrange = Color(0xFFFF7643);
const kDBlue = Color(0xFF010423);
const kPrimeColor = Color(0xFF2874F0);

const kGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const List<String> brandLogos = [
  "$brandLogoPath/aczet.jpeg",
  "$brandLogoPath/berosil.jpg",
  "$brandLogoPath/blue_star.jpeg",
  "$brandLogoPath/hicks.jpeg",
  "$brandLogoPath/himedia.jpeg",
  "$brandLogoPath/labman.jpeg",
  "$brandLogoPath/leica.jpeg",
  "$brandLogoPath/merch.jpeg",
  "$brandLogoPath/microlit.jpeg",
  "$brandLogoPath/nice.jpeg",
  "$brandLogoPath/oxy99.jpeg",
  "$brandLogoPath/polylab.jpeg",
  "$brandLogoPath/remi.jpeg",
  "$brandLogoPath/sigma_aldrich.jpeg",
  "$brandLogoPath/srl.jpeg",
  "$brandLogoPath/stanbio.jpeg",
  "$brandLogoPath/wahtman.jpeg",
];

const List<String> brandName = [
  "Aczet",
  "Borosil",
  "Blue Star",
  "Hicks",
  "Himedia",
  "Labman",
  "Leica",
  "Merch",
  "Microlit",
  "Nice",
  "Oxy 99",
  "Polylab",
  "Remi",
  "Sigma Aldrich",
  "SRL",
  "Stanbio",
  "Whatman"
];

const List<String> bannerImages = [
  "$bannerPath/banner1.jpg",
  "$bannerPath/banner2.jpg",
  "$bannerPath/banner3.jpg",
  "$bannerPath/banner4.jpeg",
  "$bannerPath/banner5.jpg",
];

const dummyText =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,";

const List randomImageUrl = [
  "https://images.pexels.com/photos/4064839/pexels-photo-4064839.jpeg",
  "https://images.pexels.com/photos/4031467/pexels-photo-4031467.jpeg",
  "https://images.pexels.com/photos/4031204/pexels-photo-4031204.jpeg",
  "https://images.pexels.com/photos/2774689/pexels-photo-2774689.jpeg",
  "https://images.pexels.com/photos/4050223/pexels-photo-4050223.jpeg",
  "https://images.pexels.com/photos/4173257/pexels-photo-4173257.jpeg",
  "https://images.pexels.com/photos/4173255/pexels-photo-4173255.jpeg",
  "https://images.pexels.com/photos/4375706/pexels-photo-4375706.jpeg",
  "https://images.pexels.com/photos/4173254/pexels-photo-4173254.jpeg",
  "https://images.pexels.com/photos/4050226/pexels-photo-4050226.jpeg",
  "https://images.pexels.com/photos/4283387/pexels-photo-4283387.jpeg",
  "https://images.pexels.com/photos/4173258/pexels-photo-4173258.jpeg",
  "https://images.pexels.com/photos/3993210/pexels-photo-3993210.jpeg",
  "https://images.pexels.com/photos/3967564/pexels-photo-3967564.jpeg",
  "https://images.pexels.com/photos/4606285/pexels-photo-4606285.jpeg",
  "https://images.pexels.com/photos/3951962/pexels-photo-3951962.jpeg",
  "https://images.pexels.com/photos/4462819/pexels-photo-4462819.jpeg",
  "https://images.pexels.com/photos/3902886/pexels-photo-3902886.jpeg",
  "https://images.pexels.com/photos/4014932/pexels-photo-4014932.jpeg",
  "https://images.pexels.com/photos/39219/macbook-apple-imac-computer-39219.jpeg",
  "https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg",
  "https://images.pexels.com/photos/4646284/pexels-photo-4646284.jpeg",
  "https://images.pexels.com/photos/4173256/pexels-photo-4173256.jpeg",
  "https://images.pexels.com/photos/3760803/pexels-photo-3760803.jpeg",
  "https://images.pexels.com/photos/3931382/pexels-photo-3931382.jpeg",
  "https://images.pexels.com/photos/3986722/pexels-photo-3986722.jpeg",
  "https://images.pexels.com/photos/4425779/pexels-photo-4425779.jpeg",
  "https://images.pexels.com/photos/3967580/pexels-photo-3967580.jpeg",
  "https://images.pexels.com/photos/4698207/pexels-photo-4698207.jpeg",
  "https://images.pexels.com/photos/4149199/pexels-photo-4149199.jpeg",
  "https://images.pexels.com/photos/4626801/pexels-photo-4626801.jpeg",
  "https://images.pexels.com/photos/4173259/pexels-photo-4173259.jpeg",
  "https://images.pexels.com/photos/3943808/pexels-photo-3943808.jpeg",
  "https://images.pexels.com/photos/4167545/pexels-photo-4167545.jpeg",
  "https://images.pexels.com/photos/4452809/pexels-photo-4452809.jpeg",
  "https://images.pexels.com/photos/3902884/pexels-photo-3902884.jpeg",
  "https://images.pexels.com/photos/3772967/pexels-photo-3772967.jpeg",
  "https://images.pexels.com/photos/4163224/pexels-photo-4163224.jpeg",
  "https://images.pexels.com/photos/4050219/pexels-photo-4050219.",
  "https://images.pexels.com/photos/4173213/pexels-photo-4173213.jpeg",
  "https://images.pexels.com/photos/4173221/pexels-photo-4173221.jpeg",
  "https://images.pexels.com/photos/4425761/pexels-photo-4425761.jpeg",
  "https://images.pexels.com/photos/3912823/pexels-photo-3912823.jpeg",
  "https://images.pexels.com/photos/4632495/pexels-photo-4632495.jpeg",
  "https://images.pexels.com/photos/4614851/pexels-photo-4614851.jpeg",
  "https://images.pexels.com/photos/3902885/pexels-photo-3902885.jpeg",
  "https://images.pexels.com/photos/4099121/pexels-photo-4099121.jpeg",
  "https://images.pexels.com/photos/4133909/pexels-photo-4133909.jpeg",
  "https://images.pexels.com/photos/4064834/pexels-photo-4064834.jpeg",
  "https://images.pexels.com/photos/3970337/pexels-photo-3970337.jpeg",
];

