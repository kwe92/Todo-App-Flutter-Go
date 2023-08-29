import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/add_task_text_form_field.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:provider/provider.dart';

@RoutePage()
class StandAloneView extends StatelessWidget {
  final TaskModel task;
  const StandAloneView({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AddTaskViewModel>().loadControllers(task.taskName, task.taskDetails);
    final [taskNameController, taskDetailController] = context.watch<AddTaskViewModel>().getAllControllers();

    return BaseScaffold(
      // showAppBar: true,
      title: 'Task View',
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
                    readOnly: true,
                    maxLines: 1,
                    controller: taskNameController,
                    hintText: 'Task Name',
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AddTaskTextFormField(
                    readOnly: true,
                    maxLines: 5,
                    controller: taskDetailController,
                    hintText: 'Task Details',
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
