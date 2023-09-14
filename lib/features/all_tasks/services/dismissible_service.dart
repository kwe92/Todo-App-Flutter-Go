import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:provider/provider.dart';

class DismissibleService {
  const DismissibleService();

  bool showSnackbar(BuildContext context, TaskModel task) {
    toastService.showSnackBar(
      context: context,
      height: ScreenSize.getHeight(context) / 3,
      backgroundColor: AppColors.grey2,
      duration: const Duration(seconds: 3),
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
                text: 'View',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  appRouter.push(
                    StandAloneRoute(task: task),
                  );
                }),
            const SizedBox(height: 20.0),
            CustomButton(
              isSecondary: true,
              text: 'Edit',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                appRouter.push(
                  EditTaskRoute(task: task),
                );
              },
            ),
          ],
        ),
      ),
    );
    return false;
  }

  void deleteTask(BuildContext context, TaskModel task) async {
    await taskService.deleteTask(int.parse(task.id));

    debugPrint('\nTASK DELETED: $task');

    context.read<AllTasksViewModel>().refresh();
  }
}
