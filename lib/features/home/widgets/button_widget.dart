import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 14,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: resolver(
              (states) => buttonColor,
            ),
            side: resolver(
              (states) => BorderSide.none,
            ),
          ),
        ),
      );
}
// ?----------------------What did you learn----------------------?

// Expanding Widgets With Container or SizedBox

//   - passing the argument double.maxFinite to height or width will expand
//     the containers child to fill all available space
//   - like a granular way to use an Expanded widget
//   - can be used instead of expanding multiple widgets

// Dynamic styling: MediaQuery.of(context)

//   - you can style dynamically using the MediaQuery.of(context).size height or width

/// utility function that makes calls to MaterialStateProperty.resolveWith shorter.
MaterialStateProperty<T?>? resolver<T>(T? Function(Set<MaterialState> states) callback) => MaterialStateProperty.resolveWith(callback);
