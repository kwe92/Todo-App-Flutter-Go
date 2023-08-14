import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
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
    final List<_TaskWidget> taskList = context
        .read<AllTasksViewModel>()
        .tasks
        .map(
          (task) => _TaskWidget(task: task),
        )
        .toList();

    return BasseScaffold(
      title: 'All Tasks View',
      child: Column(
        children: [
          const _TopSecton(),
          const _MiddleSection(),

          // Nesting ListView in Column Widget

          //   - if you need to next a ListView within a Column widget you need to wrap the ListView with a Flexible Widget

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
  const _MiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12.0, top: 6.0, right: 12.0),
      child: ColoredBox(
        color: Colors.orange,
        child: Row(
          children: [
            HomeIcon(),
            SizedBox(width: 6),
            AddIcon(),
            //? use Spacer instead of wrapping sections of the Row in Containers and spacing evenly
            Spacer(),
            Icon(
              Icons.file_copy,
            )
          ],
        ),
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
      margin: const EdgeInsets.only(top: 12.0),
      width: double.maxFinite,
      height: ScreenSize.getHeight(context) / 14,
      color: AppColors.textInputGrey,
      child: Center(
        child: Text(
          task.taskName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
