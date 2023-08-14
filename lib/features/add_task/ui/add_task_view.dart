import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/add_task/ui/widgets/add_task_text_form_field.dart';
import 'package:flutter_golang_yt/features/home/widgets/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:provider/provider.dart';

// TODO: finish completing view

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskNameController = context.watch<AddTaskViewModel>().taskNameController;
    final taskDetailController = context.watch<AddTaskViewModel>().taskDetailController;

    return BasseScaffold(
      // showAppBar: true,
      title: 'Add Task View',
      child: Stack(children: [
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          // TODO: figure out if we can make the image longer or not
          decoration: _backgroundImage,
          padding: EdgeInsets.only(
            top: ScreenSize.getHeight(context) / 3.5,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                AddTaskTextForField(
                  maxLines: 1,
                  controller: taskNameController,
                  hintText: 'Task Name',
                ),
                const SizedBox(
                  height: 24.0,
                ),
                AddTaskTextForField(
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
                    context.read<AddTaskViewModel>().clearControllers();
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          //TODO: create utility function to shorten calls to MediaQuery.of(context)
          height: ScreenSize.getHeight(context) / 12,
          padding: const EdgeInsets.only(left: 12),
          child: BackArrowIcon(
            onTap: () => appRouter.pop(),
          ),
        ),
      ]),
    );
  }
}

const _backgroundImage = BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('assets/images/addtask1.jpg'),
  ),
);
