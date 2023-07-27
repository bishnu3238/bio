import 'package:flutter/material.dart';
import 'package:universal_lab/package/size_config.dart';

import '../../class/app_constant.dart';
class EditTextBtn extends StatelessWidget {
  final VoidCallback? callBack;
  const EditTextBtn({
    super.key,required this.callBack
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: callBack,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(),
              boxShadow: [
                BoxShadow(blurRadius: 0.1, color: kError.withOpacity(0.1))
              ],
              borderRadius: BorderRadius.circular(5)),
          child: const Text('Edit')),
    );
  }
}
