import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../widgets/components/app_text.dart';
import 'colors.dart';

enum AppToastType { success, warning, error }

/// Global instance of Toastification (singleton)
final toastification = Toastification();

/// A utility class for showing toast notifications with a consistent style.
///
/// Usage:
///
/// ```dart
/// AppToast.show(
///   context: context,
///   message: "Operation successful!",
///   type: AppToastType.success,
/// );
/// ```
class AppToast {
  static void show({
    required BuildContext context,
    required String message,
    required AppToastType type,
    Duration autoCloseDuration = const Duration(seconds: 3),
    AlignmentGeometry alignment = Alignment.topCenter,
  }) {
    // Map the AppToastType to the corresponding ToastificationType and color scheme.
    late final ToastificationType toastType;
    late final Color primaryColor;
    late final Color backgroundColor;
    late final Color foregroundColor;

    switch (type) {
      case AppToastType.success:
        toastType = ToastificationType.success;
        primaryColor = AppColors.green;
        backgroundColor = AppColors.lightGreen;
        foregroundColor = AppColors.darkGreen;
        break;
      case AppToastType.warning:
        toastType = ToastificationType.warning;
        primaryColor = AppColors.orange;
        backgroundColor = AppColors.lightorange;
        foregroundColor = AppColors.darkorange;
        break;
      case AppToastType.error:
        toastType = ToastificationType.error;
        primaryColor = AppColors.red;
        backgroundColor = AppColors.lightred;
        foregroundColor = AppColors.darkred;
        break;
    }

    // Call the toastification.show method to display the toast notification.
    toastification.show(
      context: context,
      alignment: alignment,
      title: AppText(message),
      type: toastType,
      style: ToastificationStyle.flat,
      autoCloseDuration: autoCloseDuration,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      showProgressBar: false,
      closeOnClick: true,
    );
  }
}
