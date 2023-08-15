import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/add_icon.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/home_icon.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';

class MiddleSection extends StatelessWidget {
  final int taskCount;

  const MiddleSection({
    required this.taskCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 6.0,
        right: 12.0,
      ),
      child: Row(
        children: [
          const HomeIcon(),
          const SizedBox(width: 6),
          AddIcon(
            onTap: () => appRouter.push(
              const AddTaskRoute(),
            ),
          ),
          const Spacer(),
          const Icon(Icons.file_copy),
          const SizedBox(width: 6),
          Text(
            '$taskCount',
            style: mediumTextStyle,
          ),
        ],
      ),
    );
  }
}

// What You Learned | what to Review

//   - Spacer Widget

//       - use Spacer instead of wrapping sections of the Row in 
//         Containers and spacing evenly
