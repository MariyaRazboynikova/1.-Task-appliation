import 'package:hive/hive.dart';
import 'package:task_application/features/data/models/task_hive_model.dart';
import 'package:task_application/features/domain/entity/task_model.dart';
import 'package:task_application/features/domain/repository/task_repository.dart';

class TaskHiveRepository extends TaskRepository {
  // открытие хранилища
  Future<Box<TaskHiveModel>> _openBox() async {
    return await Hive.openBox('tasks_box');
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    final storage = await _openBox();
    final tasks = storage.values.cast<TaskHiveModel>().toList();
    // Метод map() создает новый итератор, который применяет функцию к каждому элементу списка tasks
    return tasks.map((task) => task.toModel()).toList();
  }

  @override
  Future<void> addTask(TaskModel newTask) async {
    final storage = await _openBox();
    final taskHive = TaskHiveModel(
      id: newTask.id,
      name: newTask.name,
      isCompleted: newTask.isCompleted,
    );
    await storage.put(newTask.id, taskHive);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final storage = await _openBox();
    if (storage.containsKey(task.id)) {
      final updateTask = TaskHiveModel(
        id: task.id,
        name: task.name,
        isCompleted: task.isCompleted,
      );
      await storage.put(task.id, updateTask);
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    final storage = await _openBox();
    if (storage.containsKey(id)) {
      await storage.delete(id);
    }
  }
}
