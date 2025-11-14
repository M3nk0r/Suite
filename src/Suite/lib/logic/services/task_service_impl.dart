import 'package:suite/cross_cutting/entities/completed_task.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/wrapper/task_wrapper.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/interfaces/task_service.dart';

class TaskServiceImpl extends TaskService {
  final DbContext context;

  TaskServiceImpl({required this.context});

  @override
  Future<void> create(Task task) async {
    final db = await context.open();

    var map = task.toMap();
    await db.insert(Task.dbName, map);

    await db.close();
  }

  @override
  Future<void> delete(String id, String userId) async {
    final db = await context.open();

    await db.delete(
      Task.dbName,
      where: 'id = ? and userId = ?',
      whereArgs: [id, userId],
    );

    await db.delete(
      CompletedTask.dbName,
      where: 'taskId = ? and taskUserId = ?',
      whereArgs: [id, userId]
    );

    await db.close();
  }

  @override
  Future<List<Task>> read() async {
    final db = await context.open();

    final List<Map<String, Object?>> maps = await db.query(Task.dbName);

    await db.close();

    return [for (final map in maps) Task.fromMap(map)];
  }

  @override
  Future<void> update(Task task) async {
    final db = await context.open();

    await db.update(
      Task.dbName,
      task.toMap(),
      where: 'id = ? and userId = ?',
      whereArgs: [task.id, task.userId],
    );

    await db.close();
  }

  @override
  Future<List<TaskWrapper>> readTaskWrapperByRoom(
    final String roomId,
    final String roomUserId,
  ) async {
    List<TaskWrapper> wrapper = [];

    final db = await context.open();
    final tasksMaps = await db.query(
      Task.dbName,
      where: 'roomId = ? and roomUserId = ?',
      whereArgs: [roomId, roomUserId],
    );
    final tasks = [for (final map in tasksMaps) Task.fromMap(map)];

    for (final task in tasks) {
      final ctMaps = await db.query(
        CompletedTask.dbName,
        where: 'taskId = ? and taskUserId = ?',
        whereArgs: [task.id, task.userId],
      );

      wrapper.add(
        TaskWrapper(
          task: task,
          completedTasks: [
            for (final map in ctMaps) CompletedTask.fromMap(map),
          ],
        ),
      );
    }

    db.close();

    return wrapper;
  }

  @override
  Future<TaskWrapper> readTaskWrapperById(String id, String userId) async {
    final db = await context.open();

    final taskMap = await db.query(
      Task.dbName,
      where: 'id = ? and userId = ?',
      whereArgs: [id, userId],
    );

    if (taskMap.isEmpty) {
      throw Error();
    }

    final task = Task.fromMap(taskMap.first);

    final ctMaps = await db.query(
      CompletedTask.dbName,
      where: 'taskId = ? and taskUserId = ?',
      whereArgs: [task.id, task.userId],
    );

    return TaskWrapper(
      task: task,
      completedTasks: [for (final map in ctMaps) CompletedTask.fromMap(map)],
    );

  }
}
