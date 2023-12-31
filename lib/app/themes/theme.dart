import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/themes/font.dart';

/// AppTheme abstracts the theme of the application.

class AppTheme {
  const AppTheme._();

  /// getTheme returns the ThemeData to style the entire application.
  static ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        outlinedButtonTheme: primaryOutlinedButtonTheme,
        inputDecorationTheme: singleLineInputDecorationTheme,
        // the base background color of the Scaffold is off-white
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.mainColor,
          selectionColor: AppColors.mainColor.withOpacity(0.25),
        ),
        // change selectionHandleColor on IOS
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: AppColors.mainColor,
        ),
      );
}

const _singleLineBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.all(
    Radius.circular(50),
  ),
);

final _multiLineInputBorder = _singleLineBorder.copyWith(
  borderRadius: const BorderRadius.all(
    Radius.circular(20),
  ),
);

/// style for single line TextFormFields.
final singleLineInputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 28.0,
    vertical: 25.0,
  ),
  filled: true,
  fillColor: AppColors.grey0,
  border: InputBorder.none,
  outlineBorder: BorderSide.none,
  enabledBorder: _singleLineBorder,
  focusedBorder: _singleLineBorder,
  errorBorder: _singleLineBorder,
  focusedErrorBorder: _singleLineBorder,
  errorStyle: AppFont.font(
    const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
);

/// style for multi line TextFormFields.
final multiLineInputDecorationTheme = singleLineInputDecorationTheme.copyWith(
  enabledBorder: _multiLineInputBorder,
  focusedBorder: _multiLineInputBorder,
  errorBorder: _multiLineInputBorder,
  focusedErrorBorder: _multiLineInputBorder,
);

final primaryOutlinedButtonTheme = OutlinedButtonThemeData(
  style: primaryButtonStyle,
);

final secondaryOutlinedButtonTheme = OutlinedButtonThemeData(
  style: secondaryButtonStyle,
);

final baseTextStyle = AppFont.font(
  const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
  ),
);

final mediumTextStyle = baseTextStyle.copyWith(
  color: Colors.blueGrey,
  fontSize: 18,
);

final primaryButtonTextStyle = baseTextStyle.copyWith(
  foreground: Paint()..color = Colors.white,
);

final whiteButtonTextStyle = baseTextStyle.copyWith(
  foreground: Paint()..color = AppColors.mainColor,
);

final primaryButtonStyle = ButtonStyle(
  side: resolver(
    (states) => BorderSide.none,
  ),
  backgroundColor: resolver(
    (states) => AppColors.mainColor,
  ),
  textStyle: resolver(
    (states) => primaryButtonTextStyle,
  ),
  overlayColor: resolver(
    (states) => AppColors.grey1.withOpacity(0.20),
  ),
);

final secondaryButtonStyle = primaryButtonStyle.copyWith(
  backgroundColor: resolver(
    (states) => Colors.white,
  ),
  textStyle: resolver(
    (states) => whiteButtonTextStyle,
  ),
);

/// utility function that makes calls to MaterialStateProperty.resolveWith shorter.
MaterialStateProperty<T?>? resolver<T>(T? Function(Set<MaterialState> states) callback) => MaterialStateProperty.resolveWith(callback);
