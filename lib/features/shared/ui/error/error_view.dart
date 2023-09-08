import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/shared/ui/centered_text_widget.dart';
import 'package:flutter_golang_yt/features/shared/ui/error/widgets/error_button.dart';
import 'package:flutter_golang_yt/features/shared/ui/error/widgets/error_image.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.grey0,
        width: double.maxFinite,
        padding: const EdgeInsets.only(
          left: 24,
          top: 48,
          right: 24,
        ),
        child: const Column(
          children: [
            ErrorImage(),
            SizedBox(height: 24),
            Text(
              "Network Issues",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CenteredText(
              text: _errorText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 78,
            ),
            ErrorButton(),
          ],
        ),
      );
}

const _errorText = "Issue connecting to the server.\nEnsure you have a stable internet connection and try again.";
