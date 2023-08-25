import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/shared/ui/clickable_icon.dart';

class AddIcon extends StatelessWidget {
  final VoidCallback onTap;
  final double sides;
  final double iconSize;

  const AddIcon({
    required this.onTap,
    this.sides = 25,
    this.iconSize = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: sides,
        height: sides,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(sides / 2),
          ),
        ),
        child: ClickableIcon(
          onTap: onTap,
          iconData: Icons.add,
          size: iconSize,
          color: Colors.white,
        ),
      );
}

// What You Learned | what to Review

// Not Seeing a Child of a Container Widget

//   - when you do not see a child of a Container Widget 
//     and the alignment isnt set
//     try setting the alignment
