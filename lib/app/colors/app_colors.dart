import 'dart:ui';

/// Encapsulates the colors used throughout this application.

class AppColors {
  const AppColors._();

  // static const mainColor = Color(0xFF202e59);
  static const mainColor = Color(0xFFdeb384);

  static const secondaryColor = Color(0xFF6c8ee3);

  // static const smallTextColor = Color(0xFF2e3253);
  static const smallTextColor = Color(0xFFfcd8b6);

  static const textHolder = Color(0xFFedf0f8);

  static const grey0 = Color(0xFFeef0f7);

  static const grey1 = Color(0xFFafb1b5);

  static const green0 = Color(0xFF1b3520);

  /// grey with opacity of 0.325.
  static final grey2 = const Color(0xFF2e3253).withOpacity(0.325);
}

// Things Learned, Things Reviewed

// ._() Named Constructor

//   - a private named constructor function
//     can only be invoked within the class
//   - removes instantiation capabilities
//     without adding a abstract class modifier

// What is 0xFF?

//   - the hex representation of #
//   - required as a prefix to hex color values
//     passed to Color as an argument to its default constructor function
