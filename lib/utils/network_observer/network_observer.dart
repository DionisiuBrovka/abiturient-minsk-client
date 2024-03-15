import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';

class NetworkHelper {

  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none || result == ConnectivityResult.other) {
        NetworkBloc().add(NetworkNotify(isConnected: false));
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}