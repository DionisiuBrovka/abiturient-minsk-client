import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (kIsWeb) {
        // запущено в вебе
        NetworkBloc().add(NetworkNotify(isConnected: true));
      } else {
        // это точно не веб.
        if (result == ConnectivityResult.none ||
            result == ConnectivityResult.other) {
          NetworkBloc().add(NetworkNotify(isConnected: false));
        } else {
          NetworkBloc().add(NetworkNotify(isConnected: true));
        }
      }
    });
  }
}
