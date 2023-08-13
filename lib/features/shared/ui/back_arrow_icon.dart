import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';

class BackArrowIcon extends StatelessWidget {
  final VoidCallback onTap;
  const BackArrowIcon({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: const Icon(
          // TODO: dynamically size this widget?
          size: 30,
          color: AppColors.secondaryColor,
          Icons.arrow_back,
        ),
      );
}
