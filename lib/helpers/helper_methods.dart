import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/navigation_keys.dart';

/// Contains helper methods to be accessed throughout the app.
class AppHelpers {
  /// Shows a snackbar with the given message and color.
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

  /// Gets the image URL based on the image UUID from Appwrite storage.
  static String getImageUrl({required String imageUuid}) {
    return '${AppConstants.endpoint}/storage/buckets/${AppConstants.imagesBucketId}/files/$imageUuid/view?project=${AppConstants.projectId}';
  }
}
