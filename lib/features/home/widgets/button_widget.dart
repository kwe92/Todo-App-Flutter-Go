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
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
      );
}
