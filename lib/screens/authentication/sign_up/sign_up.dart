import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/master.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/custom_widgets/clear_focus.dart';
import 'package:universal_lab/package/zebook.dart';
import 'class/sign_up_class.dart';
import 'sign_up_body/already_have_account.dart';
import '../sub_authentication/password_field_decoration.dart';
import 'sign_up_body/sign_up_header.dart';

SignUpData signUpData = SignUpData.empty;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    Master.initialize(context);

    return ClearFocus(
      child: Scaffold(
        appBar: _signUpAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer<SignUp>(
              builder: (context, state, _) {
                state.initController(signUpData);
                return Form(
                  key: state.signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      gap(40),
                      const SignUpHeader(),
                      gap(40),
                      _FullNameField(signUp: state),
                      gap(20),
                      _PhoneField(signUp: state),
                      gap(20),
                      _EmailField(signUp: state),
                      gap(20),
                      _PasswordField(signUp: state),
                      gap(20),
                      _ReferalCodeField(signUp: state),
                      gap(20),
                      BuildButton(
                        text: 'Sign Up',
                        isLoading: state.isLoading,
                        onPressed: () => state.sendCode(context),
                        color: kDBlue,
                      ),
                      gap(20),
                      const AlreadyHaveAccount()
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  SimpleAppBar _signUpAppBar(BuildContext context) {
    return SimpleAppBar(
      icon: FontAwesomeIcons.angleLeft,
      todo: () => Navigator.of(context).pop(),
      title: appName,
      tPosition: false,
    );
  }
}

class _ReferalCodeField extends StatelessWidget {
  const _ReferalCodeField({
    required this.signUp,
  });

  final SignUp signUp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUp.referCode,
      textInputAction: TextInputAction.next,
      onChanged: (value) =>
          signUpData = signUpData.copyWith(referralCode: value),
      decoration: borderInputDecoration(
        context: context,
        suffix: emptyIcon,
        label: 'Referral (optional)',
        prefix: const Icon(FontAwesomeIcons.optinMonster),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.signUp,
  });

  final SignUp signUp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !signUp.showPassword,
      controller: signUp.password,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) => signUpData = signUpData.copyWith(password: value),
      decoration: passwordDecoration(context),
      validator: (value) => value!.isEmpty
          ? "Please Enter Password"
          : value.length <= 3
              ? "password must more then three character"
              : null,
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.signUp,
  });

  final SignUp signUp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUp.email,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => signUpData = signUpData.copyWith(email: value),
      validator: (value) => signUp.validateEmail(value!),
      decoration: borderInputDecoration(
        context: context,
        suffix: emptyIcon,
        label: 'Email ID (optional)',
        prefix: const Icon(FontAwesomeIcons.solidEnvelope),
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({
    required this.signUp,
  });

  final SignUp signUp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUp.phone,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: signUp.checkPhoneNumber,
      validator: (value) => signUp.validatePhone(value!),
      onChanged: (value) {
        signUpData = signUpData.copyWith(phone: value);
        if (value.length == 10) {
          signUp.checkPhoneNumber(value);
        }
      },
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      decoration: borderInputDecoration(
        context: context,
        label: 'Phone no. *',
        suffix: emptyIcon,
        prefix: const Icon(FontAwesomeIcons.phone),
      ),
    );
  }
}

class _FullNameField extends StatelessWidget {
  const _FullNameField({
    required this.signUp,
  });

  final SignUp signUp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUp.name,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => signUpData = signUpData.copyWith(name: value),
      validator: (value) => signUp.validateName(value!),
      decoration: borderInputDecoration(
        context: context,
        label: 'Full Name',
        suffix: emptyIcon,
        prefix: const Icon(FontAwesomeIcons.person),
      ),
    );
  }
}

class BuildButton extends StatefulWidget {
  final String text;
  final Color? color;
  final bool isLoading;
  final Function()? onPressed;

  const BuildButton({
    Key? key,
    required this.text,
    this.color,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          backgroundColor: widget.color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: widget.isLoading
            ? const _Waiting()
            : Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

class _Waiting extends StatelessWidget {
  const _Waiting({
    this.color = Colors.white,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Waiting",
          style: GoogleFonts.rubikBurned(
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 10),
        SpinKitDualRing(
          color: color,
          size: 20,
        ),
      ],
    );
  }
}
