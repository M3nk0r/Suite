import 'package:auto_route/auto_route.dart';
import 'package:suite/ui/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: BaseRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: RoomOverviewRoute.page),
    AutoRoute(page: RoomDetailRoute.page),
    AutoRoute(page: AddTaskRoute.page),
    AutoRoute(page: TaskDetailRoute.page),
    AutoRoute(page: OptionRoute.page),
    AutoRoute(page: ImpressumRoute.page),
    AutoRoute(page: PackagesRoute.page),
    AutoRoute(page: ShoppingRoute.page),
    AutoRoute(page: ShoppingListRoute.page),
    AutoRoute(page: ShoppingItemRoute.page),
    AutoRoute(page: CategoryRoute.page),
    AutoRoute(page: CategoryOverviewRoute.page),
  ];
}