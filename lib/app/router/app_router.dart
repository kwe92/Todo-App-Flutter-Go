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

//   - can build an auto route instance for any existing classes annotated with @RoutePage
//   - the first AutoRoute should be your initial route and should be identified as such
//     by passing true as an argument to the initial property of AutoRoute

// CustomRoute

//   - a sub-type of AutoRoute that has some additional properties like transitionBuilder

// transitionsBuilder property

// - a property of CustomRoute that specifies a transition animation
//   for the CustomRoute's page