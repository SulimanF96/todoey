import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/providers/auth_provider.dart';
import 'package:todoey/providers/tasks_provider.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthModel authModel = AuthModel();
    authModel.init();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasksProvider(),),
    ChangeNotifierProvider(create: (context) => AuthModel()),
      ],
      child: MaterialApp(
    home: TasksScreen(),
    ),
    );
  }
}


