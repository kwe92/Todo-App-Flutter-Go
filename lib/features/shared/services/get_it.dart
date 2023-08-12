import 'package:flutter_golang_yt/app/router/app_router.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void configureDependencies() {
  locator.registerSingleton<AppRouter>(
    AppRouter(),
  );
}
