import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_model.dart';
import 'package:flutter_golang_yt/features/edit_task/ui/edit_task_view_model.dart';
import 'package:flutter_golang_yt/features/shared/services/get_it.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:provider/provider.dart';

// TODO: maybe implement notification service for old created tasks
void main() {
  configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddTaskViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllTasksViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditTaskViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: AppTheme.getTheme(),
      );
}
