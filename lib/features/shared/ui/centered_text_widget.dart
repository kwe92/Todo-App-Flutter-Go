import 'package:flutter/material.dart';

// TODO: Review centering text
class CenteredText extends StatelessWidget {
  final String text;

  final TextStyle style;

  const CenteredText({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );
}
