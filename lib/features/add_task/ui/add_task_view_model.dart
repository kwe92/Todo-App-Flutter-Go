// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class AddTaskViewModel extends ChangeNotifier {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDetailController = TextEditingController();

  TextEditingController get taskNameController => _taskNameController;
  TextEditingController get taskDetailController => _taskDetailController;

  void clearControllers() {
    taskNameController.clear();
    taskDetailController.clear();
    notifyListeners();
  }
}

// ChangeNotifier

//   - a simple and powerful way to manage state when used with Providers
//   - can be inherited or mixed in to provide your class with a notification API
//   - Listeners are added in constant-time O(1) and removed in linear-time O(n)

// notifyListeners

//   - calls all registered listeners (clients)
//     that are watching an object
//     should be invoked at the end of a function
//     that modifies a member variable of a model (ChangeNotifier sub-class)