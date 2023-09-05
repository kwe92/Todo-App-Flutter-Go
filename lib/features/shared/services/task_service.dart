// ignore_for_file: prefer_final_fields

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';

// TODO: handle if the response is an array or error map | check the response type

/// TaskService is a stub for sending requests to the task API endpoints.

class TaskService extends ApiService with ChangeNotifier {
  @override
  String get host => "http://127.0.0.1:8082";

  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: "application/json",
      };

  List<TaskModel> _allTasks = [];

  List<TaskModel> get allTasks => _allTasks;

  /// getAllTasks requests all tasks from the server.
  Future<dynamic> getAllTasks() async {
    final http.Response response = await get(EndPoint.gettasks.path);

    final List<dynamic> tasks = jsonDecode(response.body);

    final List<TaskModel> taskList = [for (Map<String, dynamic> task in tasks) TaskModel.fromJson(task)];

    _allTasks = taskList;

    notifyListeners();

    return taskList;
  }

  /// getTaskById request a task by id from the server.

  Future<dynamic> getTaskById(int id) async {
    final http.Response response = await get(
      EndPoint.gettask.path + id.toString(),
    );
    return jsonDecode(response.body);
  }

  /// createTask requests to add a task to the server and receives a response of all tasks.

  Future<dynamic> createTask(Map<String, dynamic> task) async {
    final http.Response response = await post(
      EndPoint.create.path,
      body: jsonEncode(task),
    );
    return jsonDecode(response.body);
  }

  /// updateTask updates the given task if it exists.

  Future<dynamic> updateTask(Map<String, dynamic> task) async {
    final response = await put(
      EndPoint.update.path + task['id'],
      body: jsonEncode(task),
    );

    return jsonDecode(response.body);
  }

  /// deleteTask removes a task with the specified id.

  Future<dynamic> deleteTask(int taskId) async {
    final response = await delete(
      EndPoint.delete.path + taskId.toString(),
    );
    return jsonDecode(response.body);
  }
}

/// EndPoint is an enumerated list of all task endpoints.

enum EndPoint {
  gettasks("/gettasks"),

  gettask("/gettask/"),

  create("/create"),

  update("/update/"),

  delete("/delete/");

  final String path;

  const EndPoint(this.path);
}
