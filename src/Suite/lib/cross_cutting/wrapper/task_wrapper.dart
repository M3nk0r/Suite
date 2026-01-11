import 'package:suite/cross_cutting/entities/completed_task.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/enums/interval_typ.dart';

class TaskWrapper {
  final Task task;
  final List<CompletedTask> completedTasks;

  TaskWrapper({required this.task, required this.completedTasks});

  void sortCompletedTasksByDone() =>
      completedTasks.sort((a, b) => a.done.compareTo(b.done));

  void sortCompletedTasksByDoneDesc() =>
      completedTasks.sort((a, b) => b.done.compareTo(a.done));

  DateTime? lastDone() {
    sortCompletedTasksByDoneDesc();
    return completedTasks.firstOrNull?.done;
  }

  DateTime next() {
    final last = lastDone();
    if (last == null) {
      return DateTime.now();
    }

    final intervalTyp = task.intervalTyp;
    final interval = task.interval;

    late DateTime next;
    if (intervalTyp == IntervalTyp.days.index) {
      next = last.add(Duration(days: interval));
    } else if (intervalTyp == IntervalTyp.weeks.index) {
      next = last.add(Duration(days: interval * 7));
    } else if (intervalTyp == IntervalTyp.month.index) {
      next = last.add(Duration(days: interval * 30));
    } else if (intervalTyp == IntervalTyp.years.index) {
      next = last.add(Duration(days: interval * 365));
    } else {
      next = DateTime.now();
    }

    return next;
  }

  // The +1 is because of the hour must always be round up.
  // E.g. you have a interval from 1 day, the output is always 'now'
  int difference() => next().difference(DateTime.now()).inDays + 1;
}
