import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/navigation_keys.dart';

class AppHelpers {
  static void showSnackbar({
    required String message,
    Color color = Colors.blueGrey,
  }) {
    final SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: color,
      content: Text(message),
    );
    NavKeys.rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static String getImageUrl({required String imageUuid}) {
    return '${AppConstants.endpoint}/storage/buckets/${AppConstants.imagesBucketId}/files/$imageUuid/view?project=${AppConstants.projectId}';
  }
}
