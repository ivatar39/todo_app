import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc.dart';
import 'package:todo_app/local_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final LocalRepository _repository;

  TodoBloc({LocalRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AppStarted) {
      yield TodoLoading();
      yield await fetchTodoList();
    }
    if (event is AddItem) {
      //yield TodoLoading();
      await _repository.addTodo(event.newTodo);
      yield await fetchTodoList();
    }
    if (event is DeleteItem) {
      yield TodoLoading();
      await _repository.deleteTodo(event.id);
      yield await fetchTodoList();
    }
  }

  Future<TodoState> fetchTodoList() async {
    final todoList = _repository.getAllTodos();
    print(todoList);
    return TodoLoaded(todoList);
  }
}
