import 'package:flutter_golang_yt/app/router/app_router.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void configureDependencies() {
  locator.registerSingleton<AppRouter>(
    AppRouter(),
  );
}

// GetIt

//   - a service locator that can register services as singletons

// GetIt Service Registration

//   - there must be some initializing configuration
//     function to register your services
//   - your configuration function must be called in main above runApp
