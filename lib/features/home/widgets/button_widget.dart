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

// Container / Sizedbox setting width or height property: double.maxFinite argument

//   - passing the argument double.maxFinite to height or width will constrain
//     the containers child to fill all available space in that direction
//   - seems like a more granular way to use an Expanded widget

MaterialStateProperty<T?>? resolver<T>(T? Function(Set<MaterialState> states) callback) => MaterialStateProperty.resolveWith(callback);
