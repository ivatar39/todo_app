import 'package:equatable/equatable.dart';
import 'package:todo_app/todo.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todoList;

  TodoLoaded(this.todoList);

  @override
  List<Object> get props => [todoList];
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);

  @override
  List<Object> get props => [message];
}
