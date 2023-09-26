import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  const AppFont._();

  static TextStyle font(TextStyle style) => GoogleFonts.openSans(
        textStyle: style,
      );
}
