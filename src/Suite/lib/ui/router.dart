import 'package:auto_route/auto_route.dart';
import 'package:suite/ui/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: HomeRoute.page, initial: false),
    AutoRoute(page: RoomOverviewRoute.page, initial: true),
    AutoRoute(page: RoomDetailRoute.page),
    AutoRoute(page: AddTaskRoute.page),
    AutoRoute(page: TaskDetailRoute.page),
  ];
}