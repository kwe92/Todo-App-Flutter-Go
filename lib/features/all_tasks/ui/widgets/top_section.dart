import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';

class TopSecton extends StatelessWidget {
  const TopSecton({super.key});

  @override
  Widget build(BuildContext context) => Entry.opacity(
        duration: const Duration(seconds: 1, milliseconds: 500),
        child: Container(
          width: double.maxFinite,
          height: ScreenSize.getHeight(context) / 3.5,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            top: 18,
            left: 12,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/coffee-table5.avif'),
            ),
          ),
          child: BackArrowIcon(
            color: AppColors.green0,
            onTap: () => appRouter.pop(),
          ),
        ),
      );
}
