import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';

class ErrorButton extends StatelessWidget {
  const ErrorButton({super.key});

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: primaryOutlinedButtonTheme.style!.copyWith(
              backgroundColor: resolver((states) => AppColors.secondaryColor),
            ),
          ),
        ),
        child: CustomButton(
          onPressed: () => appRouter.pop(),
          text: "Back Home",
        ),
      );
}
