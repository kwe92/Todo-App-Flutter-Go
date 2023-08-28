import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';

class AllTasksViewModel extends ChangeNotifier {
  Map<String, TaskModel>? _tasks;

  Map<String, TaskModel>? get tasks => _tasks;

  List<TaskModel> get taskList => _tasks!.values.toList();

  void tasksToMap(List<dynamic> allTasks) async {
    _tasks = {for (var task in allTasks) task['id']: TaskModel.fromJson(task)};
    await Future.delayed(
      const Duration(seconds: 2),
    );
    notifyListeners();
  }

  Future<void> removeTask(int taskId) async {
    _tasks!.remove(taskId);
    await taskService.deleteTask(taskId);
    notifyListeners();
  }
}
