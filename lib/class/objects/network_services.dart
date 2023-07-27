import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkService extends ChangeNotifier {
  // Create a stream controller
  final StreamController<ConnectivityResult> connectivityStreamController =
  StreamController<ConnectivityResult>();

  // Create a Connectivity object
  final Connectivity connectivity = Connectivity();

  // Create a constructor to initialize the network connectivity
  NetworkService() {
    connectivity.checkConnectivity().then((result) {
      connectivityStreamController.add(result);
    });

    // Listen for network state changes
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityStreamController.add(result);
    });
  }

  // Create a function to get the network connectivity
  Future<ConnectivityResult> getConnectivity() async {
    return await connectivity.checkConnectivity();
  }

  // Create a function to close the stream
  void disposeStream() {
    connectivityStreamController.close();
  }
}
