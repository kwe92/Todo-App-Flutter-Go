import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: AddTaskRoute.page,
        ),
      ];
}

// @AutoRouterConfig

//   - an annotation that is used to identify your application router
//   - you must @override the 'routes' getter

// AutoRoute

//   - can build an auto route instance for any existing classes annotated with @RoutePage
//   - the first AutoRoute should be your initial route and should be identified as such
//     my passing true as an argument to the initial property of AutoRoute

