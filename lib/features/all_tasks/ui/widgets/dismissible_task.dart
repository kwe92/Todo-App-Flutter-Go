import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/dismissible_background_widget.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/task_widget.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';

const double _backgroundWidgetSpacing = 25;

class DismissibleTask extends StatelessWidget {
  final TaskModel task;
  const DismissibleTask({required this.task, super.key});

  @override
  Widget build(BuildContext context) => Dismissible(
        key: UniqueKey(),
        child: TaskWidget(task: task),
        confirmDismiss: (direction) async =>
            direction == DismissDirection.endToStart ? true : dismissibleService.showSnackbar(context, task),
        onDismissed: (direction) async => direction == DismissDirection.endToStart ? dismissibleService.deleteTask(context, task) : null,
        background: DismissibleBackgroundWidget(
          color: AppColors.green0.withOpacity(0.75),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: _backgroundWidgetSpacing),
          icon: const Icon(
            Icons.edit,
          ),
        ),
        secondaryBackground: const DismissibleBackgroundWidget(
          color: Colors.redAccent,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: _backgroundWidgetSpacing),
          icon: Icon(
            Icons.delete_forever,
          ),
        ),
      );
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
// TODO: add comments for common DismissDirection
//         - DismissDirection.startToEnd
//         - DismissDirection.endToStart

//   - context.read

//       - read a value from the nearest ancestor provider of type T

//           - e.g: context.read<SomeProvidedChangeNotifier>().someMethodOrGetter

