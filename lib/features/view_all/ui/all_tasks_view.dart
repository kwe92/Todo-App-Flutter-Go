import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
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
    final allTasksModel = context.read<AllTasksViewModel>();
    final List<Widget> taskList = allTasksModel.tasks
        .map(
          (task) => Dismissible(
            key: ObjectKey(task.id),
            child: _TaskWidget(task: task),
            confirmDismiss: (direction) async {
              debugPrint(direction.name);
              debugPrint('${task.id}');
              return false;
            },
            onDismissed: (direction) {
              if (direction.name == 'endToStart') {}
            },
            background: Container(color: Colors.greenAccent),
            secondaryBackground: Container(color: Colors.redAccent),
          ),
        )
        .toList();

    return BasseScaffold(
      title: 'All Tasks View',
      child: Column(
        children: [
          const _TopSecton(),
          _MiddleSection(
            taskCount: allTasksModel.tasks.length,
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
          const AddIcon(),
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
//   - Flexible Widget: Nesting ListView in Column Widget
//   - context.read
//   - Spacer Widget
//       - use Spacer instead of wrapping sections of the Row in Containers and spacing evenly
// DecorationImage(
//          fit: BoxFit.cover, image: '...')