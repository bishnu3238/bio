import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/api/api_urls.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';
import '../../package/custom_widgets/loading_screen.dart';
import '../../screens/authentication/log_in/log_in.dart';
import '../../screens/authentication/otp/class/otp_class.dart';
import '../../screens/authentication/sign_up/class/sign_up_class.dart';
import '../../screens/authentication/sign_up/sign_up.dart';
import '../database/db.dart';
import '../model/user/user_model.dart' as u;
import '../widget_lavel_provider/notifier.dart';
import 'package:http/http.dart' as http;

typedef CodeSend = Function(String id, int? token);

class AuthService extends ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.Logout;
  String _load = Load.Loading.name;
  int? _resendToken;
  String _verificationId = "";
  static late BuildContext _context;
  FirebaseAuth auth = FirebaseAuth.instance;
  u.User? _user = u.User.fromMap(null);

  late u.UserModel _userModel;

  u.UserModel get userModel => _userModel;
  set userModel(u.UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  List<String> scopes = [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly'
  ];

  final TextEditingController otpController = TextEditingController();

  String get verificationId => _verificationId;
  int? get resendToken => _resendToken;
  String get load => _load;
  u.User? get user => _user;
  AuthStatus get authStatus => _authStatus;

  static void initialize(BuildContext context) => _context = context;

  set authStatus(AuthStatus auth) {
    _authStatus = auth;
    notifyListeners();
  }

  set load(String load) {
    _load = load;
    notifyListeners();
  }

  set user(u.User? user) {
    _user = user;
    notifyListeners();
  }

  bool isUserAuthenticated() {
    // var currentUser = auth.currentUser;
    // return currentUser != null;
    return _authStatus == AuthStatus.Login;
  }

  Future<u.UserModel?> authenticationStatus() async {
    return await DB().getUserData().then((value) {
      if (value == null) {
        _authStatus = AuthStatus.Logout;
        return null;
      } else {
        _authStatus = AuthStatus.Login;
        Map<String, dynamic> user = jsonDecode(value);
        log(user.toString());

        var userData = u.UserModel.fromMap(user);
        _userModel = userData;
        return _userModel;
      }

      log(authStatus.toString());
    });
  }

  authStateChanges() async {
    log("User Login:- ${isUserAuthenticated()}");
    if (!isUserAuthenticated()) {
      authStatus = AuthStatus.Logout;
    } else {
      auth.authStateChanges().listen(
        (event) {
          log("$event");
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

  Future<bool> signOut() async {
    try {
      authStatus = AuthStatus.Logout;
      DB().removeUserData();
      userModel = u.UserModel.empty();
      await auth.signOut();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future sendVerificationCode(String phone, CodeSend codeSend,
      [int? resend]) async {
    var phoneNumber = "+91 ${phone.replaceAll(RegExp(r'[^\d]'), '')}";

    log('$phoneNumber $resendToken $resend');

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: resend,

      // static verification complete;
      verificationCompleted: (PhoneAuthCredential credential) {
        log("verification Code: ${credential.smsCode}");
      },

      // verification failed;
      verificationFailed: (FirebaseAuthException e) {
        log("verification failed ${e.code} && ${e.message}");
        _context.read<Notifier>().loading = false;
        SignUp().httpError(e.code.toUpperCase());
        return;
      },

      // sms code send to user mobile;
      codeSent: codeSend,

      //     (String verificationId, int? resendToken) {
      //   _verificationId = verificationId;
      //   _resendToken = resendToken;
      //   _context.read<Notifier>().loading = false;
      //   Otp().thisPage(_context, verificationId, resendToken!);
      //   notifyListeners();
      // },

      // time out;
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        // Otp().setCredential(verificationId);
        log("CODEAUTORETRIEVALTIMEOUT");
      },

      //
      timeout: const Duration(seconds: 60),
    );
  }

  Future<AuthStatus> verifyCode(String verifyId, String smsCode) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verifyId,
      smsCode: smsCode,
    );

    return await auth.signInWithCredential(credential).then((userCredential) {
      if (userCredential.user != null) {
        authStatus = AuthStatus.Login;
        return authStatus;
      }
      throw Exception('Otp verification failed');
    }).catchError((e) {
      throw Exception('$e');
    });
  }

  Future<bool> signUp(SignUpData data) async {
    Uri url = Uri.parse(signUpApi);
    log(url.toString());

    return await http.post(url, body: {
      'name': data.name,
      'mobile': data.phone,
      'email': data.email,
      'password': data.password,
      'referal_code': data.referralCode,
    }).then(
      (value) {
        log("${value.statusCode}");
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          log(jsonData.toString());
          if (jsonData['status'] == 400) {
            throw Exception(jsonData['message']);
          }

          // when signup successful
          userModel = u.UserModel.fromMap(jsonData['data']);

          DB().storeUserDataIntoLocal(jsonEncode(userModel.toMap()));
          return true;
        } else {
          throw HttpException(value.statusCode.toString());
        }
      },
    );
  }

  Future<void> emailPasswordSignIn(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the home page or perform any other actions
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        log('The account already exists for that email.');
      } else {
        log('Sign up failed. Error: ${e.message}');
      }
    } catch (e) {
      log('Sign up failed. Error: $e');
    }
  }

  // google sign in;
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

          // TODO: upload into database;

          CustomSnackBar.showSnackBar("Sign in successful", kSuccess);
        } else {
          _user = u.User.fromMap(null);
        }
        _context.read<Notifier>().loading = false;

        Navigator.pushReplacement(_context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      });
    } catch (e) {
      log("******** GoogleSignUp error: $e ********");
      _context.read<Notifier>().loading = false;
      authStatus = AuthStatus.Logout;

      CustomSnackBar.showSnackBar("Sign in failed", kError);
    }
  }

  void resendOtp(String phone, int? resend) async {
    await sendVerificationCode(phone, (id, token) {}, resend);
  }

  emailSignIn(String email, String password) {
    _context.read<Notifier>().loading = true;
    auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future deleteUser() async {
    Uri url = Uri.parse(deleteUserApi);
    log('user id: ${userModel.id}');
    try {
      http.post(url, body: {'id': userModel.id}).then((value) {
        if (value.statusCode == 200) {
          log('User deleted successfully ${value.body}');
          DB().removeUserData();

          // TODO: later decide which page to go;
          // Navigator.pushReplacement(
          //   _context,
          //   MaterialPageRoute(builder: (ctx) => const LogIn()),
          // );
        } else {
          log('Failed to delete user');
          // TODO: if otp verification failed then do some thing for database user data;
          Navigator.pushReplacement(_context,
              MaterialPageRoute(builder: (ctx) => const SignupPage()));
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
