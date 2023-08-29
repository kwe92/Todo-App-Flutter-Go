import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/dismissible_task.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/middle_section.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/top_section.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:provider/provider.dart';

// TODO: Seems like widget is continuously rebuilding

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'All Tasks View',
      child: FutureBuilder(
        future: taskService.getAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('ERROR'),
              ),
            );
          } else if (snapshot.hasData) {
            // final taskModel = context.watch<AllTasksViewModel>();

            return Consumer<AllTasksViewModel>(
              builder: (context, model, child) {
                model.tasksToMap(snapshot.data);

                final observedTaskList = model.tasks?.values.toList();

                final List<Widget> taskList = [
                  ...observedTaskList!
                      .map(
                        (task) => DismissibleTask(task: task),
                      )
                      .toList()
                ];
                debugPrint("\n\nTask List: $taskList");

                return Column(
                  children: [
                    const TopSecton(),
                    MiddleSection(
                      taskCount: observedTaskList.length,
                    ),
                    Flexible(
                      child: ListView(
                        children: taskList,
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}


// Things Learned, Things Reviewed

// Nesting ListView in Column && Row Widgets

//   - wrap ListView widget with Flexible or Expanded Widget


// Observing State Without Consumer Widgets

//   - Instantiating Consumer Widgets can be expensive
//   - to avoid expensive objects to watch state changes
//   - you can instead use context.watch<ChangeNotifierSubClass>()
//     using dot notation to access properties and methods


