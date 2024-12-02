import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:task_application/core/theme/themes_provider.dart';
import 'package:task_application/features/data/models/task_hive_model.dart';
import 'package:task_application/features/data/repository/task_hive_repository.dart';
import 'package:task_application/features/domain/repository/task_repository.dart';
import 'package:task_application/features/presentation/pages/intro_page.dart';
import 'package:task_application/features/presentation/pages/task_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveModelAdapter());
  var taskRepo = TaskHiveRepository();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemesProvider(),
      child: MainApp(taskRepository: taskRepo),
    ),
  );
}

class MainApp extends StatelessWidget {
  final TaskRepository taskRepository;
  const MainApp({super.key, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemesProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/task_page': (context) => const TaskPage(),
      },
    );
  }
}
