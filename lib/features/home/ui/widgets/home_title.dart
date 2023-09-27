import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/themes/font.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) => RichText(
        maxLines: 2,
        text: TextSpan(
          text: 'Hello',
          children: [
            TextSpan(
              text: '\nstart your beautiful day.',
              style: AppFont.font(
                const TextStyle(
                  color: AppColors.smallTextColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
          style: AppFont.font(
            const TextStyle(
              color: AppColors.mainColor,
              fontSize: 60,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}

// RichText

//   - required to use TextSpan and create paragraphs of text
//   - it can control the visible lines within the paragraph
//     with the 'maxLines' property

// TextSpan

//   - a widget that allows text to span multiple lines
//   - similar to the paragraph <pr> element "tag" in CSS
//   - there are no intrinsic line break so a \n (new-line) prefix
//     is required for each line of text
//   - to have multiple lines you can pass one or more TextSpan widgets
//     to the 'children' property