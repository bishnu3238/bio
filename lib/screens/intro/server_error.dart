import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/methods/intro_function.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../class/objects/network_services.dart';
import '../../package/custom_widgets/app_bars/simple_app_bar.dart';
import 'intro.dart';

class ServerError extends StatefulWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  State<ServerError> createState() => _ServerErrorState();
}

class _ServerErrorState extends State<ServerError> {
  NetworkService network = NetworkService();
  @override
  void initState() {
    super.initState();

    network.connectivityStreamController.stream.take(1).listen(
          (event) => (event != ConnectivityResult.none)
              ? introFunctions()
              : introError(),
        );
  }

  introFunctions() {
    context.read<Notifier>().does == 0
        ? introFunction(context)
        : context.read<Notifier>().does == 1;
  }

  introError() {
    context.read<Notifier>().does = 0;
    Future.delayed(kAnimationDuration, () => showFlash(context));
  }

  showFlash(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () => context.showFlash<bool>(
        builder: (context, controller) => FlashBar(
          controller: controller,
          indicatorColor: Colors.red,
          icon: const Icon(Icons.tips_and_updates_outlined),
          title: const Text('Server not working'),
          content: const Text('Unable to connect the server.'),
          actions: [
            TextButton(
                onPressed: controller.dismiss, child: const Text('Cancel')),
            TextButton(
              onPressed: () => controller.dismiss(true).then(
                    (value) => Future.delayed(
                      kDurationSCD(1),
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const Intro(),
                        ),
                      ),
                    ),
                  ),
              child: const Text('Try again'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    network.disposeStream();
    network.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: kLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/offer_images/server_error.jpeg'),
            const SizedBox(height: 20),
            Text("Server not working", style: stl1(20, kDark, null)),
          ],
        ),
      ),
    );
  }
}
