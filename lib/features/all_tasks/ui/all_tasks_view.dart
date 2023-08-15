import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/dismissible_task.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/middle_section.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/top_section.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    final allTasksModel = context.watch<AllTasksViewModel>();

    final taskList = <Widget>[
      ...allTasksModel.taskList
          .map(
            (task) => DismissibleTask(task: task),
          )
          .toList()
    ];
    return BasseScaffold(
      title: 'All Tasks View',
      child: Column(
        children: [
          const TopSecton(),
          MiddleSection(
            taskCount: allTasksModel.taskList.length,
          ),
          Flexible(
            child: ListView(
              children: taskList,
            ),
          )
        ],
      ),
    );
  }
}


// TODO: Review module for what you have learned

// What you learned or what you want to review

//   - Flexible Widget: Nesting ListView in Column Widget

//   - context.watch


// DecorationImage(
//          fit: BoxFit.cover, image: '...')

// Container alignment property | when you do not see a child you expect to see and the alignment isnt set that is most likely the issue

// What you learned or what you want to review

//   - Spacer Widget
//       - use Spacer instead of wrapping sections of the Row in Containers and spacing evenly
