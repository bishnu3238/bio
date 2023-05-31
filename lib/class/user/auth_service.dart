import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/screens/authentication/otp.dart';

import '../../package/navigate.dart';
import '../model/user/user_model.dart' as u;

class AuthService extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.Logout;
  String _load = Load.Loading.name;
  late int? _resendToken;
  late String _verificationId;
  static late BuildContext _context;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  late Box userData;
  List<String> scopes = [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  final TextEditingController otpController = TextEditingController();

  String get verificationId => _verificationId;
  int? get resendToken => _resendToken;
  String get load => _load;

  static void initialize(BuildContext context) => _context = context;

  set load(String load) {
    _load = load;
    notifyListeners();
  }

  // Check if the user is currently authenticated
  bool isUserAuthenticated() {
    final user = auth.currentUser;
    user == null ? null : authStatus = AuthStatus.Login;
    notifyListeners();
    return user != null;
  }

  // Get the currently authenticated user
  Stream<User?> authStateChanges() {
    // intiDatabases();
    var user = auth.authStateChanges();
    user.listen((event) {
      if (event == null) {
        authStatus = AuthStatus.Logout;
        // userData.delete(HiveKey.user);
      } else {
        authStatus = AuthStatus.Login;
        // userData.put(HiveKey.user, event);
        // _user = event;
      }
    });
    // notifyListeners();
    return user;
  }

  // Sign out the user
  Future<void> signOut() async {
    authStatus = AuthStatus.Logout;
    await auth.signOut();
    notifyListeners();
  }

  Future<void> sendVerificationCode(String phone, VoidCallback onSend) async {
    var phoneNumber = "+91 ${phone.replaceAll(RegExp(r'[^\d]'), '')}";
    auth.setSettings(appVerificationDisabledForTesting: true);

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          otpController.setText(credential.smsCode!);
          Navigate.goto(_context, OtpPage(phoneNumber));
        },
        verificationFailed: (FirebaseAuthException e) {
          throw FirebaseAuthException(
              code: e.code, phoneNumber: e.phoneNumber, message: e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _resendToken = resendToken;
          notifyListeners();
          log("PNO._ $phoneNumber VID._ ${this.verificationId} & RT._ ${this.resendToken}");
          Navigate.goto(_context, OtpPage(phoneNumber));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          log("CODEAUTORETRIEVALTIMEOUT");
        },
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      log('Failed to verify phone number: $e');
      rethrow;
    }
  }

  Future<UserCredential> verifyCode(String verifyId, String smsCode) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: smsCode);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on PhoneVerificationFailed catch (e) {
      debugPrint('Failed to sign in with phone number: ${e.toString()}');
      throw FirebaseException(message: '$e', plugin: '');
    }
  }

  Future<void> googleSignIn() async {
    GoogleSignIn gSignIn = GoogleSignIn(scopes: scopes);
    // final bool isAuthorized = await gSignIn.canAccessScopes(scopes);
    // log(isAuthorized.toString());
    try {
      GoogleSignInAccount? gUser = await gSignIn.signIn();
      log(gUser!.email.toString());
      GoogleSignInAuthentication? gAuth = await gUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      await auth.signInWithCredential(credential).then((value) {
        log(value.user!.email.toString());
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void intiDatabases() async {
    userData = await Hive.openBox('user');
  }
}
