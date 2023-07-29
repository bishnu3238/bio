import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import 'package:universal_lab/screens/authentication/sub_authentication/password_field_decoration.dart';
import '../../../class/user_services/auth_service.dart';
import '../../../package/custom_decorations/constant_decoration.dart';
import '../../../package/custom_widgets/app_bars/simple_app_bar.dart';
import '../forgot_password/forgot_password.dart';
import 'login_body/create_account_sign_up.dart';
import '../../../package/loading_button.dart';
import '../../../package/text_style.dart';
import 'login_body/or.dart';
import 'login_body/phone_field.dart';
import '../sub_authentication/term_policy.dart';
import 'class/login_class.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Login login = Login();
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    Master.initialize(context);
  }

  @override
  void dispose() {
    super.dispose();
    login.disposeController();
  }

  Future _logIn() async {
    var notify = context.read<Notifier>();
    var auth = context.read<AuthService>();

    if (login.loginFormKey.currentState!.validate()) {
      try {
        await login.login(context, notify, auth);
      } catch (e) {
        notify.loading = false;
        CustomSnackBar.showSnackBar('$e', kError);
      }
    } else {
      CustomSnackBar.showToast('Enter Valid Credentials', kDark);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mas = MediaQuery.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF2874F0),
        appBar: SimpleAppBar(
          color: const Color(0xFF2874F0),
          title: appName,
          icon: FontAwesomeIcons.xmark,
          todo: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: mas.size.height - kToolbarHeight - mas.padding.top - 30,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: radiusOnlyTop(Colors.white),
            child: Form(
              key: login.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  gap(10),
                  ListTile(
                    horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(
                      "Log In",
                      style: txStl(30, Colors.blueGrey[900], FontWeight.bold),
                    ),
                    subtitle: const Text("Enter your phone number to continue"),
                  ),
                  gap(20),
                  PhoneField(
                    phone: login.phone,
                    hint: 'Phone Number',
                    onDone: (done) => FocusScope.of(context)
                        .requestFocus(login.passwordFocusNode),
                    onCountryChange: (country) => log(country.name),
                    onNumberChange: (number) =>
                        login.phone.setText(number.number),
                  ),
                  gap(20),

                  Consumer<Notifier>(
                    builder: (BuildContext context, value, _) {
                      return TextFormField(
                        focusNode: login.passwordFocusNode,
                        obscureText: value.obscureText,
                        controller: login.password,
                        onFieldSubmitted: (pass) => _logIn(),
                        decoration: passwordDecoration(context),
                        validator: (value) => value!.isEmpty || value.length < 3
                            ? "Please enter password *"
                            : null,
                      );
                    },
                  ),
                  gap(5),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          "forgot password ?",
                          style: TextStyle(color: kDark.withOpacity(0.7)),
                        ),
                      )
                    ],
                  ),
                  gap(5),
                  or,
                  gap(10),
                  const CreateAccountSignUp(),
                  // const ExtraLogInMethode(),
                  gap(50),
                  const Terms(),
                  gap(50),
                  LoadingButton(
                    color: const Color(0xFF2874F0),
                    text: 'Log In',
                    onPressed: () => _logIn(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class _PasswordField extends StatelessWidget {
//   const _PasswordField();
//
//   @override
//   Widget build(BuildContext context) {
//     return   Consumer<Login>(
//       builder: (BuildContext context, login, _) {
//         return TextFormField(
//           focusNode: login.passwordFocusNode,
//           obscureText: login.obscureText,
//           controller: login.password,
//           onFieldSubmitted: (pass) => _logIn(),
//           decoration: passwordDecoration(context),
//           validator: (value) => value!.isEmpty || value.length < 3
//               ? "Please enter password *"
//               : null,
//         );
//       },
//     );
//   }
// }
