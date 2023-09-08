import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/dismissible_task.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/middle_section.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/widgets/top_section.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/ui/error/error_view.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'All Tasks View',
      child: FutureBuilder(
        future:
            // TODO: remove anonymous delay
            () async {
          await Future.delayed(
            const Duration(seconds: 0),
          );
          return taskService.getAllTasks();
        }(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint("\n\nSnapshoot Error: ${snapshot.error}");
            // TODO: Create Error View
            return const ErrorView();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // TODO: replace with loading screen
            return const BaseScaffold(
              title: "Loading Screen",
              child: Center(
                child: SizedBox(
                  height: 42,
                  width: 42,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Consumer<AllTasksViewModel>(
              builder: (context, model, child) {
                final List<Widget> taskList = model.allTasks.map((task) => DismissibleTask(task: task)).toList();

                // TODO: maybe remove this log
                debugPrint("\ntask list from AllTasksView: $taskList");

                return Column(
                  children: [
                    const TopSecton(),
                    MiddleSection(
                      taskCount: taskList.length,
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
          // TODO: replace with loading screen
          return const BaseScaffold(
            title: "Loading Screen",
            child: Center(
              child: SizedBox(
                height: 42,
                width: 42,
                child: CircularProgressIndicator(),
              ),
            ),
          );
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


