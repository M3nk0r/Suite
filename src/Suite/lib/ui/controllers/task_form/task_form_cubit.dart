import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/room.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/enums/interval_typ.dart';
import 'package:suite/logic/services/interfaces/task_service.dart';
import 'package:suite/ui/controllers/task_form/task_form_state.dart';

class TaskFormCubit extends Cubit<TaskFormState> {
  final TaskService taskService;

  TaskFormCubit({required this.taskService})
    : super(
        TaskFormState(
          isUpdate: false,
          name: '',
          intervalTyp: IntervalTyp.days,
          interval: 1,
          duration: 5,
        ),
      );

  void init(final Room? room, final Task? task, final bool isUpdate) {
    emit(state.copyWith(room: room, task: task, isUpdate: isUpdate));

    if (task != null) {
      emit(
        state.copyWith(
          name: task.name,
          intervalTyp: IntervalTyp.values[task.intervalTyp],
          interval: task.interval,
          duration: task.duration,
        ),
      );
    }
  }

  Future<void> addOrUpdate() async {
    if (state.isUpdate && state.task != null) {
      await update();
    } else if (state.room != null) {
      await add();
    }
  }

  Future<void> add() async {
    final task = Task.create(
      userId: '',
      name: state.name,
      interval: state.interval,
      intervalTyp: state.intervalTyp.index,
      duration: state.duration,
      roomId: state.room!.id,
      roomUserId: state.room!.userId,
    );

    await taskService.create(task);
  }

  Future<void> update() async {
    final task = Task(
      id: state.task!.id,
      userId: state.task!.userId,
      name: state.name,
      interval: state.interval,
      intervalTyp: state.intervalTyp.index,
      duration: state.duration,
      roomId: state.task!.roomId,
      roomUserId: state.task!.roomUserId,
    );
    await taskService.update(task);
  }

  void onChangeName(String value) => emit(state.copyWith(name: value));

  void onSelectedIntervalTyp(IntervalTyp? value) =>
      emit(state.copyWith(intervalTyp: value));

  void onChangeInterval(String value) =>
      emit(state.copyWith(interval: int.tryParse(value)));

  void onChangeDuration(String value) =>
      emit(state.copyWith(duration: int.tryParse(value)));
}
