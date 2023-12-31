import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: isSecondary
            ? Theme.of(context).copyWith(
                outlinedButtonTheme: secondaryOutlinedButtonTheme,
              )
            : Theme.of(context),
        child: SizedBox(
          width: double.maxFinite,
          height: ScreenSize.getHeight(context) / 14,
          child: OutlinedButton(
            onPressed: onPressed,
            child: Text(
              text,
            ),
          ),
        ),
      );
}
// ?----------------------What did you learn----------------------?

// Expanding Widgets With Container or SizedBox (Constraints go down, Sizes go up, Parents set position)

//   - passing the argument double.maxFinite to height or width will expand
//     the containers child to fill all available space
//   - like a granular way to use an Expanded widget
//   - can be used instead of expanding multiple widgets

// Dynamic styling: MediaQuery.of(context).size

//   - you can style dynamically using the MediaQuery.of(context).size height or width
