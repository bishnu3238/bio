import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/authentication/log_in.dart';
import 'package:universal_lab/screens/authentication/otp.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';
import '../../package/navigate.dart';

import '../model/user/user_model.dart' as u;
import '../widget_lavel_provider/notifier.dart';

class AuthService extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.Logout;
  String _load = Load.Loading.name;
  static int? _resendToken;
  static String _verificationId = "";
  static late BuildContext _context;
  FirebaseAuth auth = FirebaseAuth.instance;
  u.User? _user = u.User.fromMap(null);
  List<String> scopes = [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly'
  ];

  final TextEditingController otpController = TextEditingController();

  String get verificationId => _verificationId;
  int? get resendToken => _resendToken;
  String get load => _load;
  u.User? get user => _user;

  static void initialize(BuildContext context) => _context = context;

  set load(String load) {
    _load = load;
    notifyListeners();
  }

  set user(u.User? user) {
    _user = user;
    notifyListeners();
  }

  bool isUserAuthenticated() {
    var currentUser = auth.currentUser;
    return currentUser != null;
  }

  authStateChanges() {
    log("User Login:- ${isUserAuthenticated()}");
    if (!isUserAuthenticated()) {
      authStatus = AuthStatus.Logout;
    } else {
      auth.authStateChanges().listen(
        (event) {
          log("event $event");
          if (event != null) {
            authStatus = AuthStatus.Login;
            _user = u.User.fromFirebase(event);
          } else {
            _user = u.User.fromMap(null);
            authStatus = AuthStatus.Logout;
          }
        },
      );
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    authStatus = AuthStatus.Logout;
    await auth.signOut();
    notifyListeners();
  }

  Future sendVerificationCode(String phone, VoidCallback onSend) async {
    var phoneNumber = "+91 ${phone.replaceAll(RegExp(r'[^\d]'), '')}";
    log(phoneNumber);
    try {
      return await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          log("verification Complete ${credential.smsCode}");
          otpController.setText(credential.smsCode!);
          Navigate.goto(
              _context,
              OtpPage(
                  phoneNumber, credential.verificationId, credential.token));
        },
        verificationFailed: (FirebaseAuthException e) {
          log("verification failed ${e.code} && ${e.message}");
          CustomSnackBar.awesomeSnack("Failed!", e.code, ContentType.failure);
          _context.read<Notifier>().loading = false;

          throw e.code;
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _resendToken = resendToken;
          _context.read<Notifier>().loading = false;

          notifyListeners();
          log("PNO._ $phoneNumber VID._ ${this.verificationId} & RT._ ${this.resendToken}");
          Navigate.goto(
              _context, OtpPage(phoneNumber, verificationId, resendToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          log("CODEAUTORETRIEVALTIMEOUT");
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      _context.read<Notifier>().loading = false;

      log('Failed to verify phone number: $e');
      throw Exception("Login Unsuccessful , Try again");
    }
  }

  Future<UserCredential> verifyCode(String verifyId, String smsCode) async {
    _context.read<Notifier>().loading = true;

    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: smsCode);
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        authStatus = AuthStatus.Login;
        _user = u.User.fromFirebase(value.user!);

        _context.read<Notifier>().loading = false;
        return value;
      });
    } on PhoneVerificationFailed catch (e) {
      _context.read<Notifier>().loading = false;
      authStatus = AuthStatus.Logout;

      debugPrint('Failed to sign in with phone number: ${e.toString()}');
      throw FirebaseException(message: '$e', plugin: '');
    }
  }

  Future<void> googleSignIn() async {
    GoogleSignIn gSignIn = GoogleSignIn(scopes: scopes);
    try {
      _context.read<Notifier>().loading = true;
      GoogleSignInAccount? gUser = await gSignIn.signIn();
      GoogleSignInAuthentication? gAuth = await gUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          _user = u.User.fromFirebase(value.user!);
          authStatus = AuthStatus.Login;

          CustomSnackBar.awesomeSnack(
              "Complete", "Sign in successful", ContentType.success);
        } else {
          _user = u.User.fromMap(null);
        }
        _context.read<Notifier>().loading = false;

        Navigate.goto(_context, const HomePage());
      });
    } catch (e) {
      log("******** GoogleSignUp error: $e ********");
      _context.read<Notifier>().loading = false;
      authStatus = AuthStatus.Logout;

      CustomSnackBar.awesomeSnack(
          "Error", "Sign in failed", ContentType.failure);
    }
  }
}
