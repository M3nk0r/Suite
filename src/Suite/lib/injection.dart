import 'package:get_it/get_it.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/completed_task_service_impl.dart';
import 'package:suite/logic/services/interfaces/completed_task_service.dart';
import 'package:suite/logic/services/interfaces/room_service.dart';
import 'package:suite/logic/services/interfaces/task_service.dart';
import 'package:suite/logic/services/room_service_impl.dart';
import 'package:suite/logic/services/task_service_impl.dart';
import 'package:suite/ui/controllers/home/home_cubit.dart';
import 'package:suite/ui/controllers/room_detail/room_detail_cubit.dart';
import 'package:suite/ui/controllers/room_overview/room_overview_cubit.dart';
import 'package:suite/ui/controllers/task_detail/task_detail_cubit.dart';
import 'package:suite/ui/controllers/task_form/task_form_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs and Cubits
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => RoomOverviewCubit(roomService: sl()));
  sl.registerFactory(() => RoomDetailCubit(taskService: sl(), completedTaskService: sl()));
  sl.registerFactory(() => TaskFormCubit(taskService: sl()));
  sl.registerFactory(() => TaskDetailCubit(taskService: sl(), completedTaskService: sl()));

  //Services
  sl.registerLazySingleton<RoomService>(() => RoomServiceImpl(context: sl()));
  sl.registerLazySingleton<TaskService>(() => TaskServiceImpl(context: sl()));
  sl.registerLazySingleton<CompletedTaskService>(() => CompletedTaskServiceImpl(context: sl()));

  // Database
  sl.registerLazySingleton<DbContext>(() => DbContext());
}