import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

// Command to refresh your routes:

//   - you must have the build_runner package added as a dependecy

//   - flutter packages pub run build_runner build

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: HomeRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          page: AddTaskRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          page: AllTasksRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        )
      ];
}

// @AutoRouterConfig

//   - an annotation that is used to identify your application router
//   - you must @override the 'routes' getter with a list of AutoRoute's

// AutoRoute

//   - classes annotated with @RoutePage can be instantiated into AutoRoutes
//     after the auto_route_generator implements their associated PageInfo
//   - Routes are objects representing a view, managed by the top level Navigator in the Widget Tree
//   - the first AutoRoute should be your initial route specified by the initial property

// CustomRoute

//   - a sub-type of AutoRoute with additional properties
//     such as transitionBuilder

// transitionsBuilder property

// - a property of CustomRoute enables transition animations