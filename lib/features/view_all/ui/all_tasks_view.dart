import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/declarations.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';
import 'package:flutter_golang_yt/features/view_all/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/view_all/ui/widgets/add_icon.dart';
import 'package:flutter_golang_yt/features/view_all/ui/widgets/home_icon.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    final allTasksModel = context.watch<AllTasksViewModel>();
    final List<Widget> taskList = allTasksModel.taskList
        .map(
          (task) =>
              // TODO: the Dismissible instantiation should be its own implemented class
              Dismissible(
            key: ObjectKey(task.id),
            child: _TaskWidget(task: task),
            confirmDismiss: (direction) async {
              debugPrint(direction.name);
              debugPrint('${task.id}');
              return direction.name == 'endToStart' ? true : false;
            },
            onDismissed: (direction) {
              // TODO: Add a task deleted toast service snack bar?
              // TODO: handle startTOend dismiss condition | edit or view snack bar options
              if (direction.name == 'endToStart') {
                print('TASK DELETED');
                allTasksModel.removeTask(task.id);
              }
            },
            // TODO: Refactor background and secondaryBackground containers to keep code D.R.Y
            background: Container(
              margin: const EdgeInsets.only(top: 17),
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                // borderRadius: BorderRadius.all(
                //   Radius.circular(12.5),
                // ),
              ),
              child: const Icon(
                Icons.edit,
                color: AppColors.mainColor,
              ),
            ),
            // TODO: Refactor
            secondaryBackground: Container(
              margin: const EdgeInsets.only(top: 17),
              padding: const EdgeInsets.only(right: 25),
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                // borderRadius: BorderRadius.all(
                //   Radius.circular(12.5),
                // ),
              ),
              child: const Icon(
                Icons.delete_forever,
                color: AppColors.mainColor,
              ),
            ),
          ),
        )
        .toList();

    return BasseScaffold(
      title: 'All Tasks View',
      child: Column(
        children: [
          const _TopSecton(),
          _MiddleSection(
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

class _TopSecton extends StatelessWidget {
  const _TopSecton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ScreenSize.getHeight(context) / 3.5,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(
        top: 18,
        left: 12,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/header1.jpg'),
        ),
      ),
      child: BackArrowIcon(
        onTap: () => appRouter.pop(),
      ),
    );
  }
}

class _MiddleSection extends StatelessWidget {
  final int taskCount;

  const _MiddleSection({
    required this.taskCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 6.0,
        right: 12.0,
      ),
      child: Row(
        children: [
          const HomeIcon(),
          const SizedBox(width: 6),
          AddIcon(
            onTap: () => appRouter.push(
              const AddTaskRoute(),
            ),
          ),
          const Spacer(),
          const Icon(Icons.file_copy),
          const SizedBox(width: 6),
          Text(
            '$taskCount',
            style: mediumTextStyle,
          ),
        ],
      ),
    );
  }
}

class _TaskWidget extends StatelessWidget {
  final Task task;
  const _TaskWidget({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ScreenSize.getHeight(context) / 14,
      margin: const EdgeInsets.only(
        left: 12.0,
        top: 17.0,
        right: 12.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.grey0,
        borderRadius: BorderRadius.all(
          Radius.circular(12.5),
        ),
      ),
      child: Center(
        child: Text(
          task.taskName,
          textAlign: TextAlign.center,
          style: mediumTextStyle,
        ),
      ),
    );
  }
}

// TODO: Review module for what you have learned

// What you learned or what you want to review

//   - Dismissible Widget

//       - confirmDissmiss property
//       - onDissmiss property
//       - background property 
//       - onBackground property
//       - ObjectKey property

//   - Flexible Widget: Nesting ListView in Column Widget

//   - context.read

//   - context.watch

//   - Spacer Widget
//       - use Spacer instead of wrapping sections of the Row in Containers and spacing evenly

// DecorationImage(
//          fit: BoxFit.cover, image: '...')

// Container alignment property | when you do not see a child you expect to see and the alignment isnt set that is most likely the issue