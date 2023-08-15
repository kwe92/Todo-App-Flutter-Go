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


// What You Learned | what to Review

// Nesting ListView in Column Widget

//   - wrap a ListView widget with a Flexible Widget if you want
//     the Widget to be a child of a Column or Row Widget


// Observing State Without Consumer Widgets

//   - Instantiating Consumer Widgets can be expensive
//   - to avoid expensive objects to watch state changes
//   - instead you can use context.watch<ChangeNotifierSubClass>().statefulPropery


