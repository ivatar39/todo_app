import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/bloc/bloc.dart';
import 'package:todo_app/local_repository.dart';
import 'package:todo_app/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final repository = LocalRepository(prefs);

  runApp(
    BlocProvider(
      create: (context) => TodoBloc(repository: repository)..add(AppStarted()),
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: MainPage(),
    );
  }
}
