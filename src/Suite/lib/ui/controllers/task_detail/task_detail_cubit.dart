import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/completed_task.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/wrapper/task_wrapper.dart';
import 'package:suite/logic/services/interfaces/completed_task_service.dart';
import 'package:suite/logic/services/interfaces/task_service.dart';
import 'package:suite/ui/controllers/task_detail/task_detail_state.dart';

class TaskDetailCubit extends Cubit<TaskDetailState> {
  final TaskService taskService;
  final CompletedTaskService completedTaskService;

  TaskDetailCubit({
    required this.taskService,
    required this.completedTaskService,
  }) : super(TaskDetailState());

  Future<void> init(Task task) async {
    state.taskWrapper = TaskWrapper(task: task, completedTasks: []);
    final wrapper = await taskService.readTaskWrapperById(task.id, task.userId);
    wrapper.sortCompletedTasksByDoneDesc();
    emit(state.copyWith(taskWrapper: wrapper));
  }

  Future<void> reload() async {
    final wrapper = await taskService.readTaskWrapperById(
      state.taskWrapper.task.id,
      state.taskWrapper.task.userId,
    );
    wrapper.sortCompletedTasksByDoneDesc();
    emit(state.copyWith(taskWrapper: wrapper));
  }

  Future<void> deleteCompletedTask(final CompletedTask ct) async {
    await completedTaskService.delete(ct.taskId, ct.taskUserId, ct.done);
  }

  Future<void> deleteTask() async {
    await taskService.delete(
      state.taskWrapper.task.id,
      state.taskWrapper.task.userId,
    );
  }

  Future<void> taskDone() async {
    await completedTaskService.create(
      CompletedTask(
        taskId: state.taskWrapper.task.id,
        taskUserId: state.taskWrapper.task.userId,
        userId: '',
        done: DateTime.now(),
      ),
    );
    await reload();
  }
}
