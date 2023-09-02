import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/ui/clickable_icon.dart';

class BackArrowIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  const BackArrowIcon({required this.onTap, this.color, super.key});

  @override
  Widget build(BuildContext context) => ClickableIcon(
        onTap: onTap,
        color: color,
        iconData: Icons.arrow_back,
      );
}
