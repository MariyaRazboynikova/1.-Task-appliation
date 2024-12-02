class TaskModel {
  final int id;
  final String name;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });

  TaskModel toggleComleted() {
    return TaskModel(
      id: id,
      name: name,
      isCompleted: !isCompleted,
    );
  }

  TaskModel toModel() => TaskModel(
        id: id,
        name: name,
        isCompleted: isCompleted,
      );

  TaskModel copyWith({int? id, String? name, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
