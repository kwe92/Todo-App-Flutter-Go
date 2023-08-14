// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/declarations.dart';

class AllTasksViewModel extends ChangeNotifier {
  Map<int, Task> _tasks = {
    1101: (
      id: 1101,
      taskName: 'Just Keep Coding',
      taskDetails: 'Clean code is the best code!',
    ),
    1102: (
      id: 1102,
      taskName: 'Code for 3 hours',
      taskDetails: 'when attention meets intention.',
    ),
    1103: (
      id: 1103,
      taskName: 'Begin',
      taskDetails: 'To begin is half of the work let half still remain, again begin this and though wilt have finish.',
    ),
  };
  // List<String> get taskNames => tasks.map((task) => task.taskName as String).toList();

  List<Task> get taskList => _tasks.values.toList();

  void addTask(String taskName, String taskDetails) {
    // TODO modify implementation when you use real data
    final taskId = taskList.last.id + 1;
    _tasks.addAll({
      taskId: (
        id: taskId,
        taskName: taskName,
        taskDetails: taskDetails,
      )
    });
    notifyListeners();
  }

  void removeTask(int taskId) {
    _tasks.remove(taskId);
    notifyListeners();
  }
}
