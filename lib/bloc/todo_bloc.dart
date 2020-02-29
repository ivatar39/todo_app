import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc.dart';
import 'package:todo_app/todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AppStarted) {
      yield TodoLoading();
      yield TodoLoaded(await fetchTodoList());
    }
    if (event is AddItem) {
      yield TodoLoading();
      // TODO: yield TodoAdded();
    }
    if (event is DeleteItem) {
      yield TodoLoading();
      // TODO: yield TodoDeleted();
    }
  }

  Future<List<Todo>> fetchTodoList() async {
    List todoList = [];
    todoList.add(Todo(task: 'Сделать дз по географии'));
    todoList.add(Todo(task: 'Убрать комнату'));
    todoList.add(Todo(task: 'Поужинать'));
    await Future.delayed(Duration(seconds: 1));
    return todoList;
  }
}
