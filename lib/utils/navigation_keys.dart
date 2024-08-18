import 'package:flutter/material.dart';

/// Contains global keys for navigation and snackbar.
class NavKeys {
  static GlobalKey<NavigatorState> rootNavKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
