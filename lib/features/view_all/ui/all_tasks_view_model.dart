// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/declarations.dart';

class AllTasksViewModel extends ChangeNotifier {
  List<Task> _tasks = [
    (
      id: 1101,
      taskName: 'Just Keep Coding',
      taskDetails: 'Clean code is the best code!',
    ),
    (
      id: 1102,
      taskName: 'Code for 3 hours',
      taskDetails: 'when attention meets intention.',
    ),
    (
      id: 1103,
      taskName: 'Begin',
      taskDetails: 'To begin is half of the work let half still remain, again begin this and though wilt have finish.',
    ),
  ];

  List<String> get taskNames => tasks.map((task) => task.taskName as String).toList();

  List get tasks => _tasks;

  void addTask() {}
  void removeTask() {}
}
