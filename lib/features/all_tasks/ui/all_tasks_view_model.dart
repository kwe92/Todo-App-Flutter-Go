import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';

class AllTasksViewModel extends ChangeNotifier {
  List<TaskModel> _allTasks = taskService.allTasks;

  List<TaskModel> get allTasks => _allTasks;

  void refresh() {
    debugPrint("\nFrom Refresh: ${taskService.allTasks}");
    _allTasks = taskService.allTasks;
    notifyListeners();
  }
}
