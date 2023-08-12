import 'package:flutter_golang_yt/app/router/app_router.dart';
import 'package:flutter_golang_yt/features/shared/services/get_it.dart';

AppRouter get appRouter => locator.get<AppRouter>();

// Services Module

// - a module that houses all of
//   your located registered singletons
