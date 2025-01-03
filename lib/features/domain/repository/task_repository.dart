import 'package:task_application/features/domain/entity/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel newTask);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int id);
}
