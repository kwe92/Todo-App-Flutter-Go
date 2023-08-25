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
    required Duration duration,
  }) {
    const Radius topBorderRadius = Radius.circular(25);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        // note: elevation adds a slight transparent grey underneath background color
        elevation: 0,
        duration: duration,
        content: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: topBorderRadius,
              topRight: topBorderRadius,
            ),
          ),
          child: content,
        ),
      ),
    );
  }
}
