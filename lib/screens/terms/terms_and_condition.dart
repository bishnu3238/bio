import 'package:flutter/material.dart';

import '../../package/custom_widgets/app_bars/simple_app_bar.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        icon: Icons.arrow_back_ios,
        todo: () => Navigator.of(context).pop(),
        title: 'Terms & Conditions',
      ),
    );
  }
}
