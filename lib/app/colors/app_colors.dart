import 'dart:ui';

/// Encapsulates the colors used throughout this application.
class AppColors {
  const AppColors._();

  static const mainColor = Color(0xFF202e59);
  static const secondaryColor = Color(0xFF6c8ee3);
  static const smallTextColor = Color(0xFF2e3253);
  static const textHolder = Color(0xFFedf0f8);
  static const grey0 = Color(0xFFeef0f7);
  static const grey1 = Color(0xFFafb1b5);

  /// grey with opacity of 0.325.
  static final grey2 = const Color(0xFF2e3253).withOpacity(0.325);
}

// TODO: Clean up what you learned comments

// What Your Learned or what you want to review

  // ._() suffix to a Constructor Function
  
  //   - a named constructor that can only be used within the class
  //   - disables instantiation of a class without adding an abstract class modifier
  
  // What is 0xFF?