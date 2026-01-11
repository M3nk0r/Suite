import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/completed_task.dart';
import 'package:suite/cross_cutting/entities/room.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/logic/services/interfaces/completed_task_service.dart';
import 'package:suite/logic/services/interfaces/task_service.dart';
import 'package:suite/ui/controllers/room_detail/room_detail_state.dart';

class RoomDetailCubit extends Cubit<RoomDetailState> {
  final TaskService taskService;
  final CompletedTaskService completedTaskService;

  RoomDetailCubit({
    required this.taskService,
    required this.completedTaskService,
  }) : super(RoomDetailState(tasks: []));

  Future<void> init(final Room room) async {
    state.room = room;
    final tasks = await taskService.readTaskWrapperByRoom(room.id, room.userId);

    emit(state.copyWith(room: room, tasks: tasks));
    sortingTask();
  }

  Future<void> refreshTasks() async {
    final tasks = await taskService.readTaskWrapperByRoom(
      state.room.id,
      state.room.userId,
    );
    emit(state.copyWith(tasks: tasks));
    sortingTask();
  }

  Future<void> taskDone(Task task) async {
    await completedTaskService.create(
      CompletedTask(
        taskId: task.id,
        taskUserId: task.userId,
        userId: '',
        done: DateTime.now(),
      ),
    );

    await refreshTasks();
    sortingTask();
  }

  void sortingTask(){
    state.tasks.sort((a, b) => a.difference().compareTo(b.difference()));
  }
}
