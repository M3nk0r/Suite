import 'package:get_it/get_it.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/category_service_impl.dart';
import 'package:suite/logic/services/completed_task_service_impl.dart';
import 'package:suite/logic/services/interfaces/category_service.dart';
import 'package:suite/logic/services/interfaces/completed_task_service.dart';
import 'package:suite/logic/services/interfaces/room_service.dart';
import 'package:suite/logic/services/interfaces/shopping_item_service.dart';
import 'package:suite/logic/services/interfaces/shopping_list_item_service.dart';
import 'package:suite/logic/services/interfaces/shopping_list_service.dart';
import 'package:suite/logic/services/interfaces/task_service.dart';
import 'package:suite/logic/services/room_service_impl.dart';
import 'package:suite/logic/services/shopping_item_service_impl.dart';
import 'package:suite/logic/services/shopping_list_item_service_impl.dart';
import 'package:suite/logic/services/shopping_list_service_impl.dart';
import 'package:suite/logic/services/task_service_impl.dart';
import 'package:suite/ui/controllers/base/base_cubit.dart';
import 'package:suite/ui/controllers/category/category_cubit.dart';
import 'package:suite/ui/controllers/category_overview/category_overview_cubit.dart';
import 'package:suite/ui/controllers/home/home_cubit.dart';
import 'package:suite/ui/controllers/room_detail/room_detail_cubit.dart';
import 'package:suite/ui/controllers/room_overview/room_overview_cubit.dart';
import 'package:suite/ui/controllers/shopping/shopping_cubit.dart';
import 'package:suite/ui/controllers/shopping_item/shopping_item_cubit.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_cubit.dart';
import 'package:suite/ui/controllers/task_detail/task_detail_cubit.dart';
import 'package:suite/ui/controllers/task_form/task_form_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs and Cubits
  sl.registerFactory(() => BaseCubit());
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => RoomOverviewCubit(roomService: sl()));
  sl.registerFactory(
    () => RoomDetailCubit(taskService: sl(), completedTaskService: sl()),
  );
  sl.registerFactory(() => TaskFormCubit(taskService: sl()));
  sl.registerFactory(
    () => TaskDetailCubit(taskService: sl(), completedTaskService: sl()),
  );
  sl.registerFactory(() => ShoppingCubit());
  sl.registerFactory(() => ShoppingListCubit());
  sl.registerFactory(() => ShoppingItemCubit());
  sl.registerFactory(() => CategoryCubit(categoryService: sl()));
  sl.registerFactory(() => CategoryOverviewCubit(categoryService: sl()));

  //Services
  sl.registerLazySingleton<RoomService>(() => RoomServiceImpl(context: sl()));
  sl.registerLazySingleton<TaskService>(() => TaskServiceImpl(context: sl()));
  sl.registerLazySingleton<CompletedTaskService>(
    () => CompletedTaskServiceImpl(context: sl()),
  );
  sl.registerLazySingleton<CategoryService>(
    () => CategoryServiceImpl(context: sl()),
  );
  sl.registerLazySingleton<ShoppingListService>(
    () => ShoppingListServiceImpl(context: sl()),
  );
  sl.registerLazySingleton<ShoppingListItemService>(
    () => ShoppingListItemServiceImpl(context: sl()),
  );
  sl.registerLazySingleton<ShoppingItemService>(
    () => ShoppingItemServiceImpl(context: sl()),
  );

  // Database
  sl.registerLazySingleton<DbContext>(() => DbContext());
}
