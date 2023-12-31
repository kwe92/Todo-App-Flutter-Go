import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/add_icon.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/home_icon.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';

class MiddleSection extends StatelessWidget {
  final int taskCount;

  const MiddleSection({
    required this.taskCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Entry.opacity(
        duration: const Duration(seconds: 2, milliseconds: 750),
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.0,
            top: ScreenSize.getHeight(context) / 24,
            right: 12.0,
            bottom: 18,
          ),
          child: Row(
            children: [
              const HomeIcon(),
              const SizedBox(width: 8),
              AddIcon(
                onTap: () => appRouter.push(
                  const AddTaskRoute(),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.file_copy,
                color: AppColors.green0.withOpacity(.70),
              ),
              const SizedBox(width: 8),
              Text(
                '$taskCount',
                style: mediumTextStyle,
              ),
            ],
          ),
        ),
      );
}

// Things Learned, Things Reviewed

//   - Spacer Widget

//       - use Spacer instead of wrapping sections of the Row in 
//         Containers and spacing evenly
