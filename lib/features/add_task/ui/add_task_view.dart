import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/shared/ui/add_task_text_form_field.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/services/toast_service.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:provider/provider.dart';

// TODO: Need to implement add task to server
// TODO: Figure out why reloading state is not efficient

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final [taskNameController, taskDetailController] = context.watch<AddTaskViewModel>().getAllControllers();

    return BaseScaffold(
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
                    onPressed: () {
                      final bool isNotEmpty = context.read<AddTaskViewModel>().isNotEmpty();
                      final String taskName = taskNameController.text;
                      final String taskDetail = taskDetailController.text;

                      if (isNotEmpty) {
                        debugPrint('\nAdded Task Name:$taskName\n');
                        debugPrint('\nAdded Task Details:$taskDetail\n');
                        taskService.createTask({"taskName": taskName, "taskDetails": taskDetail});
                        ToastService.showSnackBar(
                          context: context,
                          height: ScreenSize.getHeight(context) / 8,
                          backgroundColor: AppColors.mainColor,
                          duration: const Duration(seconds: 1),
                          content: Center(
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
              onTap: () => appRouter.popAndPush(const HomeRoute()),
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
