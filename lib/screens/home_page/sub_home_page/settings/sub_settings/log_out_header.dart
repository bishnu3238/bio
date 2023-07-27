import 'package:flutter/material.dart';
import '../../../../../package/custom_widgets/buttons/custom_buttons.dart';
import '../../../../authentication/log_in/log_in.dart';

class LogOutHeader extends StatelessWidget {
  const LogOutHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Buttons(
          text: "Log In",
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const LogIn()),
              )),
    );
  }
}
