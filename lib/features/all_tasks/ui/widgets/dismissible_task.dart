import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/task_widget.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/toast_service.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:provider/provider.dart';

class DismissibleTask extends StatelessWidget {
  final TaskModel task;
  const DismissibleTask({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: TaskWidget(task: task),
      confirmDismiss: (direction) async {
        debugPrint(direction.name);
        debugPrint('${task.id}');
        if (direction == DismissDirection.endToStart) {
          return true;
        } else {
          ToastService.showSnackBar(
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
                      context.read<AddTaskViewModel>().loadControllers(
                            task.taskName,
                            task.taskDetails,
                          );
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
      },
      onDismissed: (direction) {
        // TODO: Add a task deleted toast service snack bar?
        if (direction == DismissDirection.endToStart) {
          print('\n\nTASK DELETED');
          appRouter.push(SplashRoute());
          context.read<AllTasksViewModel>().removeTask(task.id);
        }
        if (direction == DismissDirection.startToEnd) {
          print('\n\nEDIT MODE');
        }
      },
      background: const _DismissibleBackgroundWidget(
        color: Colors.greenAccent,
        alignment: Alignment.centerLeft,
        icon: Icon(
          Icons.edit,
          color: AppColors.mainColor,
        ),
      ),
      secondaryBackground: const _DismissibleBackgroundWidget(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        icon: Icon(
          Icons.delete_forever,
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}

class _DismissibleBackgroundWidget extends StatelessWidget {
  final Color color;
  final Alignment alignment;
  final Icon icon;

  const _DismissibleBackgroundWidget({
    required this.color,
    required this.alignment,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      padding: const EdgeInsets.only(right: 25),
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
      ),
      child: icon,
    );
  }
}

 // Things Learned, Things Reviewed


//   - Dismissible Widget

//       - the child of a Dismissible widget can be dragged
//         in a specified direction to indicate its dismissile
//         commonly used in lists to create animations for deletion or other actions

//       - confirmDissmiss property

//           - add predicates to confirm or deny a dismissile in a specified direction

//       - onDismissed property

//           - called after confirmDismiss and any resizing of the activated widget

//       - background property

//           - a Widget that is stacked behind the child
//           - if a secondaryBackground Widget has been instantiated
//             then the background Widget is only visible when dragging
// 
//       - secondaryBackground property

//           - a Widget that is only shown when the child has bee dragged

//       - ObjectKey property

//           - a way to identify what widget you are targeting to be dragged

//       - DismissDirection enumeration

//         - an enumerated list of all of the directions
//           in which a dismissible widget can be dismissed

//   - context.read

//       - read a value from the nearest ancestor provider of type T

//           - e.g: context.read<SomeProvidedChangeNotifier>().someMethodOrGetter

