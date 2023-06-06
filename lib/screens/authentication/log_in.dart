import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_snack_bar.dart';
import '../../class/user_services/auth_service.dart';
import '../../package/custom_widgets/app_bars/simple_app_bar.dart';
import 'sub_authentication/extra_log_in_method.dart';
import '../../package/loading_button.dart';
import '../../package/text_style.dart';
import 'sub_authentication/phone_field.dart';
import 'sub_authentication/term_policy.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  final _phone = TextEditingController();

  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    BioCellar.initialize(context);
  }

  @override
  void dispose() {
    super.dispose();
    _phone.dispose();
  }

  Future _logIn() async {
    try {
      context.read<Notifier>().loading = true;
      await auth.sendVerificationCode(_phone.text, () {});
    } catch (e) {
      context.read<Notifier>().loading = false;

      CustomSnackBar.awesomeSnack("title", "message", ContentType.failure);
      log("****** Login error $e ******");
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var media = MediaQuery.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF2874F0),
        appBar: SimpleAppBar(
          color: const Color(0xFF2874F0),
          title: "Universal Lab",
          icon: FontAwesomeIcons.xmark,
          todo: () {},
        ),
        body: SingleChildScrollView(
          child: Container(
            height: media.size.height - kToolbarHeight - media.padding.top - 30,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 20),
                  PhoneField(
                    phone: _phone,
                    hint: 'Phone Number',
                    onNumberChange: (number) => _phone.setText(number.number),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDivider(),
                      const Text(" or "),
                      buildDivider(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ExtraLogInMethode(),
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Terms()],
                  ),
                  const SizedBox(height: 50),
                  LoadingButton(
                      color: const Color(0xFF2874F0),
                      text: 'Log In',
                      onPressed: () => _logIn()),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(thickness: 0.5, color: Colors.grey),
    );
  }
}
