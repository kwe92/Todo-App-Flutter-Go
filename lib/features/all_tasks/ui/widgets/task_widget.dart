import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/declarations.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ScreenSize.getHeight(context) / 14,
      margin: const EdgeInsets.only(
        left: 12.0,
        top: 17.0,
        right: 12.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.grey0,
        // ? remove maybe??
        // borderRadius: BorderRadius.all(
        //   Radius.circular(12.5),
        // ),
      ),
      child: Center(
        child: Text(
          task.taskName,
          textAlign: TextAlign.center,
          style: mediumTextStyle,
        ),
      ),
    );
  }
}
