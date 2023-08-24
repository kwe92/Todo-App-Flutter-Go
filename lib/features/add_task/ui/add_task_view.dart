import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/add_task/ui/widgets/add_task_text_form_field.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/services/toast_service.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final [taskNameController, taskDetailController] = context.watch<AddTaskViewModel>().getAllControllers();

    return BasseScaffold(
      // showAppBar: true,
      title: 'Add Task View',
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: _backgroundImage,
            padding: EdgeInsets.only(
              top: ScreenSize.getHeight(context) / 3.5,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  AddTaskTextFormField(
                    maxLines: 1,
                    controller: taskNameController,
                    hintText: 'Task Name',
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AddTaskTextFormField(
                    maxLines: 5,
                    controller: taskDetailController,
                    hintText: 'Task Details',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomButton(
                    text: 'Add',
                    onPressed:
                        // TODO: add toast service snack bar to notify user the task has been added
                        () {
                      final bool isNotEmpty = context.read<AddTaskViewModel>().isNotEmpty();
                      final taskName = taskNameController.text;
                      final taskDetail = taskDetailController.text;

                      if (isNotEmpty) {
                        print('\nAdded Task:${taskNameController.text.trim().length}\n');

                        context.read<AllTasksViewModel>().addTask(taskName, taskDetail);

                        ToastService.showSnackBar(
                          context: context,
                          height: ScreenSize.getHeight(context) / 8,
                          backgroundColor: AppColors.mainColor,
                          duration: const Duration(seconds: 1),
                          content: Center(
                            // TODO: this can be implemented better
                            child: Text(
                              'Added Task:\n$taskName',
                              style: baseTextStyle,
                            ),
                          ),
                        );

                        context.read<AddTaskViewModel>().clearControllers();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: ScreenSize.getHeight(context) / 12,
            padding: const EdgeInsets.only(left: 12),
            child: BackArrowIcon(
              onTap: () => appRouter.pop(),
            ),
          ),
        ],
      ),
    );
  }
}

const _backgroundImage = BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('assets/images/addtask1.jpg'),
  ),
);
