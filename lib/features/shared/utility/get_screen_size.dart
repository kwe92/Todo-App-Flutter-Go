import 'package:flutter/material.dart';

/// utility function that shortens the call to MediaQuery.of(context).size for height and width.
class ScreenSize {
  const ScreenSize._();

  /// utility function that shortens the call to MediaQuery.of(context).size.height.
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  /// utility function that shortens the call to MediaQuery.of(context).size.width.
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
