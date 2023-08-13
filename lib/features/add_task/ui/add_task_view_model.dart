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
