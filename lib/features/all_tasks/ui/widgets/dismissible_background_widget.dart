import 'package:flutter/material.dart';

class DismissibleBackgroundWidget extends StatelessWidget {
  final Color color;
  final Alignment alignment;
  final EdgeInsets padding;
  final Icon icon;

  const DismissibleBackgroundWidget({
    required this.color,
    required this.alignment,
    required this.padding,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 17),
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          color: color,
        ),
        child: icon,
      );
}
