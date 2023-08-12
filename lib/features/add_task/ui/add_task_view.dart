import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';

// TODO: finish completing view

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  Widget build(BuildContext context) => const BasseScaffold(
        showAppBar: true,
        title: 'Add Task View',
        child: SizedBox(
          child: Column(
            children: [],
          ),
        ),
      );
}
