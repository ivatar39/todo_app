import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/todo.dart';

class LocalRepository {
  final SharedPreferences prefs;

  LocalRepository(this.prefs);

  Future<void> addTodo(Todo todo) async {
    await prefs.setString(
      '${todo.id}',
      jsonEncode(todo.toJson()),
    );
  }

  List<Todo> getAllTodos() {
    Set keys = prefs.getKeys();
    return List.generate(
        keys.length,
        (index) => Todo.fromJson(
            jsonDecode(prefs.getString(keys.lookup((index + 1).toString())))));
  }

  Future<void> deleteTodo(int id) async {
    await prefs.remove(id.toString());
  }
}
