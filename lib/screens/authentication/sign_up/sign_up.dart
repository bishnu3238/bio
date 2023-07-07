import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/custom_widgets/clear_focus.dart';
import 'package:universal_lab/package/zebook.dart';
import '../../../class/widget_lavel_provider/notifier.dart';
import '../../../package/loading_button.dart';
import 'class/sign_up_class.dart';
import 'sign_up_body/already_have_account.dart';
import '../sub_authentication/password_field_decoration.dart';
import 'sign_up_body/sign_up_header.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignUp signUp = SignUp();
  bool showPassword = true;

  _signUp(BuildContext context) async {
    var notify = context.read<Notifier>();
    var auth = context.read<AuthService>();

    if (signUp.signUpFormKey.currentState!.validate()) {
      try {
        await signUp.signUp(notify, auth);
      } catch (e) {
        auth.deleteUser(); // TODO: remove it;
        signUp.httpError(e);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    signUp.disposeController();
  }

  @override
  Widget build(BuildContext context) {
    Master.initialize(context);

    return ClearFocus(
      child: Scaffold(
        appBar: SimpleAppBar(
            icon: FontAwesomeIcons.angleLeft,
            todo: () => Navigator.of(context).pop(),
            title: appName,
            tPosition: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: signUp.signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  gap(40),
                  signUpHeader,
                  gap(40),
                  TextFormField(
                    controller: signUp.name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) => signUp.validateName(value!),
                    decoration: borderInputDecoration(
                        context: context,
                        label: 'Full Name',
                        suffix: emptyIcon,
                        prefix: const Icon(FontAwesomeIcons.person)),
                  ),
                  gap(20),
                  TextFormField(
                    controller: signUp.phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) => signUp.validatePhone(value!),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: borderInputDecoration(
                        context: context,
                        label: 'Phone no. *',
                        suffix: emptyIcon,
                        prefix: const Icon(FontAwesomeIcons.solidEnvelope)),
                  ),
                  gap(20),
                  TextFormField(
                    controller: signUp.email,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => signUp.validateEmail(value!),
                    decoration: borderInputDecoration(
                        context: context,
                        suffix: emptyIcon,
                        label: 'Email ID (optional)',
                        prefix: const Icon(FontAwesomeIcons.solidEnvelope)),
                  ),
                  gap(20),
                  Consumer<Notifier>(
                    builder: (BuildContext context, value, Widget? child) {
                      return TextFormField(
                        obscureText: value.obscureText,
                        controller: signUp.password,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: passwordDecoration(context),
                      );
                    },
                  ),
                  gap(20),
                  TextFormField(
                    controller: signUp.referCode,
                    textInputAction: TextInputAction.next,
                    decoration: borderInputDecoration(
                        context: context,
                        suffix: emptyIcon,
                        label: 'Referral (optional)',
                        prefix: const Icon(FontAwesomeIcons.optinMonster)),
                  ),
                  gap(20),
                  LoadingButton(
                      text: "Sign Up",
                      color: Colors.blueGrey[800],
                      onPressed: () => _signUp(context)),
                  gap(20),
                  const AlreadyHaveAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
