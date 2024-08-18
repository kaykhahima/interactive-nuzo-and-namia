import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// This class is responsible for checking the network connection status.
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async =>
      await InternetConnection().hasInternetAccess;
}
