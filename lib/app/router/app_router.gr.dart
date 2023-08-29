// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view.dart' as _i1;
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view_copy.dart' as _i2;
import 'package:flutter_golang_yt/features/home/ui/home_view.dart' as _i3;
import 'package:flutter_golang_yt/features/shared/models/task_model.dart' as _i8;
import 'package:flutter_golang_yt/features/shared/ui/splash_view.dart' as _i4;
import 'package:flutter_golang_yt/features/standalone/ui/standalone_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AddTaskRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddTaskView(),
      );
    },
    AllTasksRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AllTasksView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(orElse: () => const SplashRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SplashView(
          duration: args.duration,
          key: args.key,
        ),
      );
    },
    StandAloneRoute.name: (routeData) {
      final args = routeData.argsAs<StandAloneRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.StandAloneView(
          task: args.task,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTaskView]
class AddTaskRoute extends _i6.PageRouteInfo<void> {
  const AddTaskRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AllTasksView]
class AllTasksRoute extends _i6.PageRouteInfo<void> {
  const AllTasksRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AllTasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTasksRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashView]
class SplashRoute extends _i6.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    int duration = 1,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            duration: duration,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<SplashRouteArgs> page = _i6.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.duration = 30,
    this.key,
  });

  final int duration;

  final _i7.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{duration: $duration, key: $key}';
  }
}

/// generated route for
/// [_i5.StandAloneView]
class StandAloneRoute extends _i6.PageRouteInfo<StandAloneRouteArgs> {
  StandAloneRoute({
    required _i8.TaskModel task,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          StandAloneRoute.name,
          args: StandAloneRouteArgs(
            task: task,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StandAloneRoute';

  static const _i6.PageInfo<StandAloneRouteArgs> page = _i6.PageInfo<StandAloneRouteArgs>(name);
}

class StandAloneRouteArgs {
  const StandAloneRouteArgs({
    required this.task,
    this.key,
  });

  final _i8.TaskModel task;

  final _i7.Key? key;

  @override
  String toString() {
    return 'StandAloneRouteArgs{task: $task, key: $key}';
  }
}
