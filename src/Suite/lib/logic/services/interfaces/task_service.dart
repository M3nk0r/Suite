import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/wrapper/task_wrapper.dart';

abstract class TaskService{
  Future<void> create(Task task);
  Future<List<Task>> read();
  Future<void> update(Task task);
  Future<void> delete(String id, String userId);
  Future<List<TaskWrapper>> readTaskWrapperByRoom(final String roomId, final String roomUserId);
  Future<TaskWrapper> readTaskWrapperById(final String id, final String userId);
}