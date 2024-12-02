import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_application/features/presentation/bloc/task_cubit.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  void _showAddTaskWindow(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (comtext) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextFormField(
          maxLines: 3,
          controller: textController,
          decoration: InputDecoration(
              hintText: 'Add task',
              fillColor: Theme.of(context).colorScheme.secondary),
        ),
        actions: [ButtonForAlertDialog(comtext)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
