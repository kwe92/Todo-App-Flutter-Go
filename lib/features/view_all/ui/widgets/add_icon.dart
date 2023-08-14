import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/shared/ui/clickable_icon.dart';

class AddIcon extends StatelessWidget {
  final VoidCallback onTap;
  const AddIcon({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    const double sides = 25;
    return Container(
      alignment: Alignment.center,
      width: sides,
      height: sides,
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.all(
          Radius.circular(sides / 2),
        ),
      ),
      child: ClickableIcon(
        onTap: onTap,
        iconData: Icons.add,
        size: 16,
        color: Colors.white,
      ),
    );
  }
}
