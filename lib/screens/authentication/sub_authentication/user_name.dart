import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/loading_button.dart';
import 'package:universal_lab/screens/home_page/home_page.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppAppBar(
        elevation: 0,
        buttons: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "SKIP",
              style: theme.titleMedium!.copyWith(
                  color: Colors.red[700], fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: media.height,
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.green.shade50,
              leading: Icon(
                Icons.check_circle_outline,
                color: Colors.green.shade800,
              ),
              title: Text(
                "Welcome to Universal Lab",
                style: theme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: const Text("Your account has been created"),
            ),
            const SizedBox(height: 30),
            Consumer<Notifier>(
              builder: (context, notifier, _) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Radio(
                                value: UserType.User,
                                groupValue: notifier.userType,
                                onChanged: (type) => notifier.userType = type!),
                            Text("User"),
                          ],
                        )),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: UserType.Company,
                                  groupValue: notifier.userType,
                                  onChanged: (type) =>
                                      notifier.userType = type!),
                              const Text("Company")
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifier.userType == UserType.User
                                ? "What is your name ?"
                                : "What is your company name ?",
                            style: theme.headlineSmall,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: notifier.userType == UserType.User
                                    ? "Type your name (optional)"
                                    : "Type your company name ",
                                border: const OutlineInputBorder()),
                          ),
                          const SizedBox(height: 10),
                          notifier.userType == UserType.Company
                              ? TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Type Company GSTIN no.",
                                      border: OutlineInputBorder()),
                                )
                              : const SizedBox(),
                          const SizedBox(height: 30),
                          LoadingButton(
                              color: Colors.redAccent.shade400,
                              text: "Continue",
                              onPressed: ()=>

                                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const HomePage()))
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
