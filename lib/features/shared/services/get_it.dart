import 'package:flutter_golang_yt/app/router/app_router.dart';
import 'package:flutter_golang_yt/features/shared/services/task_service.dart';
import 'package:flutter_golang_yt/features/shared/services/toast_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt locator = GetIt.instance;

/// configureDependencies initalizes and registers all GetIt singletons.

void configureDependencies() {
  locator.registerSingleton<AppRouter>(
    AppRouter(),
  );

  locator.registerSingleton<TaskService>(
    TaskService(),
  );

  locator.registerSingleton<http.Client>(
    http.Client(),
  );

  locator.registerSingleton<ToastService>(
    const ToastService(),
  );
}

// GetIt

//   - a service locator that can register services as singletons

// GetIt Service Registration

//   - there must be some initializing configuration
//     function to register your services
//   - your configuration function must be called in main above runApp
