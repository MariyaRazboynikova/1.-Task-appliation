import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_application/core/theme/themes.dart';
import 'package:task_application/core/theme/themes_provider.dart';
import 'package:task_application/features/domain/entity/task_model.dart';
import 'package:task_application/features/presentation/bloc/task_cubit.dart';
import 'package:task_application/features/presentation/widgets/my_buttons.dart';

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
        actions: [
          ButtonForAlertDialog(
            onTap: () => Navigator.of(context).pop(taskCubit),
            text: 'Close',
          ),
          ButtonForAlertDialog(
            onTap: () {
              final taskName = textController.text.trim();
              if (taskName.isNotEmpty) {
                taskCubit.addTask(taskName);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The task should be not empty!'),
                  ),
                );
              }
            },
            text: 'Add',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final themesProvider = context.watch<ThemesProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskWindow(context),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            'My Tasks',
            style: GoogleFonts.dmSerifDisplay(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Switch(
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveThumbColor: Theme.of(context).colorScheme.surface,
            // inactiveTrackColor: Theme.of(context).colorScheme.secondary,
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const Icon(
                      Icons.sunny); // Иконка при включенном состоянии
                }
                return const Icon(
                    Icons.star); // Иконка при выключенном состоянии
              },
            ),
            value: themesProvider.themeData == darkMode,
            onChanged: (value) {
              themesProvider.toggleTheme();
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/intro_page',
              (route) => false,
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ),
      ),
      body: BlocBuilder<TaskCubit, List<TaskModel>>(
        builder: (context, tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(
                  task.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) => taskCubit.toggleTask(task),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            'Are you sure you want to delete this task?'),
                        actions: [
                          ButtonForAlertDialog(
                            onTap: () => Navigator.of(context).pop(),
                            text: 'Отмена',
                          ),
                          ButtonForAlertDialog(
                            onTap: () {
                              taskCubit.deleteTask(task.id);
                              Navigator.of(context).pop();
                            },
                            text: 'Delete',
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
