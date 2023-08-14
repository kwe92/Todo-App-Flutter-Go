import 'package:flutter/material.dart';

/// A ToastService API which provides temporary content for the user to see such as [SnackBar]'s and [MaterialBanner]'s.
class ToastService {
  const ToastService._();

  /// A reusable snack bar that persists as the user navigates.
  static void showSnackBar({
    required BuildContext context,
    required double height,
    required Color backgroundColor,
    required Widget content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: SizedBox(
          height: height,
          child: content,
        ),
      ),
    );
  }
}
