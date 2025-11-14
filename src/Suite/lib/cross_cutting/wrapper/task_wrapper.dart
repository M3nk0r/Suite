import 'package:suite/cross_cutting/entities/completed_task.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/enums/interval_typ.dart';

class TaskWrapper{
  final Task task;
  final List<CompletedTask> completedTasks;

  TaskWrapper({required this.task, required this.completedTasks});

  void sortCompletedTasksByDone() => completedTasks.sort((a, b) => a.done.compareTo(b.done));
  void sortCompletedTasksByDoneDesc() => completedTasks.sort((a, b) => b.done.compareTo(a.done));

  DateTime? lastDone() {
    sortCompletedTasksByDoneDesc();
    return completedTasks.firstOrNull?.done;
  }

  DateTime next() {
    final last = lastDone();
    if(last == null) {
      return DateTime.now();
    }

    final intervalTyp = task.intervalTyp;
    final interval = task.interval;

    late DateTime next;
    if(intervalTyp == IntervalTyp.days.index){
      next = last.add(Duration(days: interval));
    }
    else if(intervalTyp == IntervalTyp.weeks.index){
      next = last.add(Duration(days: interval * 7));
    }
    else if(intervalTyp == IntervalTyp.month.index) {
      next = last.add(Duration(days: interval * 30));
    }
    else if(intervalTyp == IntervalTyp.years.index) {
      next = last.add(Duration(days: interval * 365));
    }
    else {
      next = DateTime.now();
    }

    return next;
  }

  String intervalText() {
    final dif = next().difference(DateTime.now());

    if(dif.inDays == 0) {
      return 'Now';
    }
    else if( dif.inDays.isNegative){
      return 'Due for ${-dif.inDays} days';
    }
    else {
      return 'Due in ${dif.inDays} days';
    }
  }

}