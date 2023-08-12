import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      outlinedButtonTheme: primaryOutlinedButtonTheme,
    );
  }
}

final primaryOutlinedButtonTheme = OutlinedButtonThemeData(
  style: blueButtonStyle,
);

final secondaryOutlinedButtonTheme = OutlinedButtonThemeData(
  style: whiteButtonStyle,
);

const baseButtonTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final blueButtonTextStyle = baseButtonTextStyle.copyWith(
  foreground: Paint()..color = Colors.white,
);

final whiteButtonTextStyle = baseButtonTextStyle.copyWith(
  foreground: Paint()..color = AppColors.smallTextColor,
);

final blueButtonStyle = ButtonStyle(
  side: resolver(
    (states) => BorderSide.none,
  ),
  backgroundColor: resolver(
    (states) => AppColors.mainColor,
  ),
  textStyle: resolver(
    (states) => blueButtonTextStyle,
  ),
);

final whiteButtonStyle = blueButtonStyle.copyWith(
  backgroundColor: resolver(
    (states) => Colors.white,
  ),
  textStyle: resolver(
    (states) => whiteButtonTextStyle,
  ),
);

/// utility function that makes calls to MaterialStateProperty.resolveWith shorter.
MaterialStateProperty<T?>? resolver<T>(T? Function(Set<MaterialState> states) callback) => MaterialStateProperty.resolveWith(callback);
