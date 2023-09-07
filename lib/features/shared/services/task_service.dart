// ignore_for_file: prefer_final_fields

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_golang_yt/features/shared/models/task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';

// TODO: handle if the response is an array or error map | check the response type

/// TaskService sends requests to the task API endpoints.
class TaskService extends ApiService {
  @override
  String get host => "http://127.0.0.1:8082";

  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: "application/json",
      };

  List<TaskModel> _allTasks = [];

  List<TaskModel> _singleTask = [];

  List<TaskModel> get allTasks => _allTasks;

  List<TaskModel> get singleTask => _singleTask;

  /// getAllTasks requests all tasks from the server.
  Future<List<TaskModel>> getAllTasks() async {
    final http.Response response = await get(EndPoint.gettasks.path);

    final List<dynamic> tasks = jsonDecode(response.body);

    final taskList = <TaskModel>[for (Map<String, dynamic> task in tasks) TaskModel.fromJson(task)];

    _allTasks = taskList;

    debugPrint("\nFrom getAllTasks: $taskList");

    return taskList;
  }

  /// getTaskById request a task by id from the server.
  Future<void> getTaskById(int id) async {
    final http.Response response = await get(
      EndPoint.gettask.path + id.toString(),
    );

    final Map<String, dynamic> task = jsonDecode(response.body);

    final taskList = <TaskModel>[TaskModel.fromJson(task)];

    _singleTask = taskList;

    debugPrint("\nFrom getTaskById: $taskList");
  }

  /// createTask requests to add a task to the server and receives a response of all tasks.
  Future<void> createTask(Map<String, dynamic> task) async {
    final http.Response response = await post(
      EndPoint.create.path,
      body: jsonEncode(task),
    );

    final List<dynamic> tasks = jsonDecode(response.body);

    final taskList = <TaskModel>[for (Map<String, dynamic> task in tasks) TaskModel.fromJson(task)];

    _allTasks = taskList;

    debugPrint("\nFrom createTask: $taskList");
  }

  /// updateTask updates the given task if it exists.
  Future<void> updateTask(Map<String, dynamic> task) async {
    final response = await put(
      EndPoint.update.path + task['id'],
      body: jsonEncode(task),
    );

    final List<dynamic> tasks = jsonDecode(response.body);

    final taskList = <TaskModel>[for (Map<String, dynamic> task in tasks) TaskModel.fromJson(task)];

    _allTasks = taskList;

    debugPrint("\nFrom updateTask: $taskList");
  }

  /// deleteTask removes a task with the specified id.
  Future<void> deleteTask(int taskId) async {
    final response = await delete(
      EndPoint.delete.path + taskId.toString(),
    );

    final List<dynamic> tasks = jsonDecode(response.body);

    final taskList = <TaskModel>[for (Map<String, dynamic> task in tasks) TaskModel.fromJson(task)];

    _allTasks = taskList;

    debugPrint("\n\nFrom deleteTask: $allTasks");
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
