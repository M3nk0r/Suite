import 'package:suite/cross_cutting/wrapper/task_wrapper.dart';

class TaskDetailState {
  late final TaskWrapper taskWrapper;

  TaskDetailState();

  TaskDetailState.all({required this.taskWrapper});

  TaskDetailState copyWith({final TaskWrapper? taskWrapper,}) {
    return TaskDetailState.all(taskWrapper: taskWrapper ?? this.taskWrapper,);
  }


}