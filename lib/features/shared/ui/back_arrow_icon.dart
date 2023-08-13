import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/ui/clickable_icon.dart';

class BackArrowIcon extends StatelessWidget {
  final VoidCallback onTap;
  const BackArrowIcon({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => ClickableIcon(
        onTap: onTap,
        iconData: Icons.arrow_back,
      );
}
