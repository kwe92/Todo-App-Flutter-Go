import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';

class ClickableIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final double size;
  final Color color;

  const ClickableIcon({
    required this.onTap,
    required this.iconData,
    this.color = AppColors.secondaryColor,
    this.size = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Icon(
          size: size,
          color: color,
          iconData,
        ),
      );
}
