import 'package:suite/cross_cutting/entities/room.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/enums/interval_typ.dart';

class TaskFormState {
  final Room? room;
  final Task? task;
  final bool isUpdate;
  final String name;
  final IntervalTyp intervalTyp;
  final int interval;
  final int duration;

  TaskFormState({
    required this.isUpdate,
    required this.name,
    required this.intervalTyp,
    required this.interval,
    required this.duration,
    this.room,
    this.task,
  });

  TaskFormState copyWith({
    final String? name,
    final IntervalTyp? intervalTyp,
    final int? interval,
    final int? duration,
    final Room? room,
    final Task? task,
    final bool? isUpdate
  }) {
    return TaskFormState(
      isUpdate: isUpdate ?? this.isUpdate,
      name: name ?? this.name,
      intervalTyp: intervalTyp ?? this.intervalTyp,
      interval: interval ?? this.interval,
      duration: duration ?? this.duration,
      room: room ?? this.room,
      task: task ?? this.task,
    );
  }
}
