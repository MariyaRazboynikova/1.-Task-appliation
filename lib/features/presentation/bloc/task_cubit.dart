import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_application/features/domain/entity/task_model.dart';
import 'package:task_application/features/domain/repository/task_repository.dart';

class TaskCubit extends Cubit<List<TaskModel>> {
  final TaskRepository taskRepository;

  //generate uniqi id
  // оператор % для ограничения значения идентификатора до 32-битного целого числа (4294967296).
  int generateUniquID() {
    return DateTime.now().millisecondsSinceEpoch % 4294967296;
  }

  TaskCubit(this.taskRepository) : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final taskList = await taskRepository.getTasks();
    emit(taskList);
  }

  Future<void> addTask(String name) async {
    final newTask = TaskModel(
      id: generateUniquID(),
      name: name,
    );
    await taskRepository.addTask(newTask);
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await taskRepository.deleteTask(id);
    loadTasks();
  }

  Future<void> toggleTask(TaskModel task) async {
    final toggleTask = task.toggleComleted();
    await taskRepository.updateTask(toggleTask);
    loadTasks();
  }

  Future<void> updateTaskName(int id, String newName) async {
    final taskList = await taskRepository.getTasks();
    final taskToUpdate = taskList.firstWhere((task) => task.id == id);

    final updatedTask = taskToUpdate.copyWith(name: newName);
    await taskRepository.updateTask(updatedTask);
    loadTasks(); // Перезагружаем список задач
  }
}
