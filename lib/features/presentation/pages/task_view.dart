import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_application/features/domain/repository/task_repository.dart';
import 'package:task_application/features/presentation/bloc/task_cubit.dart';
import 'package:task_application/features/presentation/pages/task_page.dart';

class TaskView extends StatelessWidget {
  final TaskRepository taskRepo;
  const TaskView({super.key, required this.taskRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(taskRepo),
      child: const TaskPage(),
    );
  }
}
