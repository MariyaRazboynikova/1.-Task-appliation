import 'package:task_application/features/domain/entity/task_model.dart';
import 'package:hive/hive.dart';
part 'task_hive_model.g.dart';

@HiveType(typeId: 0)
class TaskHiveModel extends TaskModel {
  @override
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  bool isCompleted;

  TaskHiveModel(
      {required this.id, required this.name, this.isCompleted = false})
      : super(
          id: id,
          name: name,
          isCompleted: isCompleted,
        );

  @override
  TaskModel toggleComleted() {
    return TaskModel(
      id: id,
      name: name,
      isCompleted: !isCompleted,
    );
  }

  @override
  TaskModel toModel() => TaskModel(
        id: id,
        name: name,
        isCompleted: isCompleted,
      );

  @override
  TaskModel copyWith({int? id, String? name, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
