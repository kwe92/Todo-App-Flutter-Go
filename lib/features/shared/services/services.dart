import 'package:flutter_golang_yt/app/router/app_router.dart';
import 'package:flutter_golang_yt/features/all_tasks/services/dismissible_service.dart';
import 'package:flutter_golang_yt/features/shared/services/get_it.dart';
import 'package:flutter_golang_yt/features/shared/services/task_service.dart';
import 'package:flutter_golang_yt/features/shared/services/toast_service.dart';
import 'package:flutter_golang_yt/features/shared/services/utilities/string_service.dart';
import 'package:http/http.dart' as http;

AppRouter get appRouter => locator.get<AppRouter>();

TaskService get taskService => locator.get<TaskService>();

http.Client get client => locator.get<http.Client>();

ToastService get toastService => locator.get<ToastService>();

DismissibleService get dismissibleService => locator.get<DismissibleService>();

StringService get stringService => locator.get<StringService>();





// Services Module

// - a module that houses all of
//   your located registered singletons
