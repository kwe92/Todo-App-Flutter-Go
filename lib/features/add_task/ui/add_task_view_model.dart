// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class AddTaskViewModel extends ChangeNotifier {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDetailController = TextEditingController();

  TextEditingController get taskNameController => _taskNameController;
  TextEditingController get taskDetailController => _taskDetailController;

  List<TextEditingController> getAllControllers() => <TextEditingController>[taskNameController, taskDetailController];

  bool isNotEmpty() => taskNameController.text.trim().isNotEmpty && taskDetailController.text.trim().isNotEmpty ? true : false;

  void clearControllers() {
    taskNameController.clear();
    taskDetailController.clear();
    notifyListeners();
  }

  void loadControllers(String taskName, String taskDetails) {
    taskNameController.text = taskName;
    taskDetailController.text = taskDetails;
    notifyListeners();
  }
}

// ChangeNotifier

//   - a simple and powerful way to manage state
//     used in conjunction with the Provider package
//   - CnageNotifier can be inherited or mixed into as class
//     providing a notification API
//   - Listeners are added in constant-time O(1)
//     removed in linear-time O(n)

// notifyListeners

//   - calls all registered listeners (clients / objects observing state)
//     that are watching or Consuming an object
//     should be invoked at the end of a method if the state is changed
//     within a ChangeNotifier