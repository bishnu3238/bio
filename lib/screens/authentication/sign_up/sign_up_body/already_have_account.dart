import 'package:flutter/material.dart';

import '../../log_in/log_in.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const LogIn())),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account ? ",
                style: TextStyle(fontSize: 17, color: Colors.black)),
            Text(
              "Log In",
              style: TextStyle(color: Colors.orange, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
