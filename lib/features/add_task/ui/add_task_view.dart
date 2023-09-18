import 'package:auto_route/auto_route.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/shared/ui/add_task_text_form_field.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Consumer<AddTaskViewModel>(
      builder: (context, model, _) => BaseScaffold(
        // showAppBar: true,
        title: 'Add Task View',
        child: Entry.opacity(
          duration: const Duration(seconds: 2),
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: ScreenSize.getHeight(context) / 3.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/coffee-table4.webp"),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                padding: EdgeInsets.only(
                  top: ScreenSize.getHeight(context) / 2.875,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AddTaskTextFormField(
                          maxLines: 1,
                          controller: model.taskNameController,
                          hintText: 'Task Name',
                          // TODO: Fix, not working as intended
                          // onChanged: model.setTaskName,
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        AddTaskTextFormField(
                          maxLines: 5,
                          controller: model.taskDetailController,
                          hintText: 'Task Details',
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        CustomButton(
                          text: 'Add',
                          onPressed: () async {
                            final bool isNotEmpty = model.isNotEmpty();
                            final String taskName = model.taskNameController.text;
                            final String taskDetail = model.taskDetailController.text;

                            if (formKey.currentState!.validate() && isNotEmpty) {
                              debugPrint('\nAdded Task Name:$taskName\n');
                              debugPrint('\nAdded Task Details:$taskDetail\n');

                              await taskService.createTask({"task_name": taskName, "task_details": taskDetail});
                              context.read<AllTasksViewModel>().refresh();
                              toastService.showSnackBar(
                                context: context,
                                height: ScreenSize.getHeight(context) / 8,
                                backgroundColor: AppColors.grey2,
                                duration: const Duration(seconds: 1),
                                content: Center(
                                  child: Text(
                                    'Added Task:\n$taskName',
                                    style: baseTextStyle,
                                  ),
                                ),
                              );

                              model.clearControllers();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: ScreenSize.getHeight(context) / 12,
                padding: const EdgeInsets.only(left: 12),
                child: BackArrowIcon(
                  color: AppColors.green0,
                  onTap: () {
                    model.clearControllers();
                    appRouter.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
