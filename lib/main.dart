import 'package:task_application/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveModelAdapter());
  var taskRepo = TaskHiveRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
        // Добавьте TaskCubit сюда
        Provider(
          create: (context) => TaskCubit(taskRepo),
        ),
      ],
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
