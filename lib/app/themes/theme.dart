import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';

/// AppTheme abstracts the theme of the application.

class AppTheme {
  const AppTheme._();

  /// getTheme returns the ThemeData to style the entire application.

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      outlinedButtonTheme: primaryOutlinedButtonTheme,
      inputDecorationTheme: singleLineInputDecorationTheme,
      scaffoldBackgroundColor:
          Colors.white, // the base background color of the Scaffold is off-white if you look hard enough you can see this
    );
  }
}

///
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

const singleLineInputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(
    horizontal: 28.0,
    vertical: 25.0,
  ),
  filled: true,
  fillColor: AppColors.grey0,
  border: InputBorder.none,
  outlineBorder: BorderSide.none,
  enabledBorder: _singleLineBorder,
  focusedBorder: _singleLineBorder,
);

/// style for single line TextFormFields.
final multiLineInputDecorationTheme = singleLineInputDecorationTheme.copyWith(
  enabledBorder: _multiLineInputBorder,
  focusedBorder: _multiLineInputBorder,
);

final primaryOutlinedButtonTheme = OutlinedButtonThemeData(
  style: primaryButtonStyle,
);

final secondaryOutlinedButtonTheme = OutlinedButtonThemeData(
  style: secondaryButtonStyle,
);

const baseTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final mediumTextStyle = baseTextStyle.copyWith(
  color: Colors.blueGrey,
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
