// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view.dart'
    as _i1;
import 'package:flutter_golang_yt/features/all_tasks/ui/all_tasks_view.dart'
    as _i2;
import 'package:flutter_golang_yt/features/home/ui/home_view.dart' as _i3;
import 'package:flutter_golang_yt/features/shared/ui/splash_view.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddTaskRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddTaskView(),
      );
    },
    AllTasksRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AllTasksView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SplashView(
          duration: args.duration,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTaskView]
class AddTaskRoute extends _i5.PageRouteInfo<void> {
  const AddTaskRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AllTasksView]
class AllTasksRoute extends _i5.PageRouteInfo<void> {
  const AllTasksRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AllTasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTasksRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashView]
class SplashRoute extends _i5.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    int duration = 1,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            duration: duration,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<SplashRouteArgs> page =
      _i5.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.duration = 1,
    this.key,
  });

  final int duration;

  final _i6.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{duration: $duration, key: $key}';
  }
}
