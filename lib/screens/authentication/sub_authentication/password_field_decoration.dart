import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/zebook.dart';

import '../../../class/app_constant.dart';
import '../sign_up/class/sign_up_class.dart';

InputDecoration passwordDecoration(BuildContext context) {
  return borderInputDecoration(
    radius: 5,
    context: context,
    label: 'Password',
    suffix: Consumer<Notifier>(
      builder: (context, notify, _) {
        var value = notify.obscureText;

        return InkWell(
          child: Icon(
            value ? Icons.visibility_off : Icons.visibility,
            color: value ? kSuccess : kError,
          ),
          onTap: () => notify.togglePasswordVisibility(),
        );
      },
    ),
    prefix: Consumer<Notifier>(
      builder: (context, notify, _) {
        var value = notify.obscureText;
        return value
            ? const Icon(FontAwesomeIcons.lock)
            : const Icon(FontAwesomeIcons.lockOpen);
      },
    ),
  );
}
