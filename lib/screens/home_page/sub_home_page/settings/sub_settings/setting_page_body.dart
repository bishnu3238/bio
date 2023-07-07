import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../class/user_services/auth_service.dart';
import '../../../../../class/enums.dart';
import '../../../../../package/custom_widgets/buttons/custom_buttons.dart';
import '../../../../../package/custom_widgets/loading_screen.dart';
import '../../../../../package/size_config.dart';
import 'setting_page_const_body.dart';
import 'settings_page_login_body.dart';

class SettingPageBody extends StatefulWidget {
  const SettingPageBody({Key? key}) : super(key: key);

  @override
  State<SettingPageBody> createState() => _SettingPageBodyState();
}

class _SettingPageBodyState extends State<SettingPageBody> {
  Widget _buildLogOutButton(AuthService auth) {
    return Container(
      width: getProportionateScreenWidth(375),
      padding: const EdgeInsets.all(10),
      child: Buttons(
        text: "Log out",
        onTap: () {
          'joy'.log();
          auth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => const LoadingScreen()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, auth, _) {
        return Column(
          children: [
            if (auth.authStatus == AuthStatus.Login) ...[
              const SettingPageLogInBody(),
            ],
            const SettingPageConstBody(),
            if (auth.authStatus == AuthStatus.Login) ...[
              _buildLogOutButton(auth),
            ],
          ],
        );
      },
    );
  }
}
