import 'package:equatable/equatable.dart';
import 'package:todo_app/todo.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddItem extends TodoEvent {
  final Todo newTodo;

  AddItem(this.newTodo);

  @override
  List<Object> get props => [newTodo];
}

class DeleteItem extends TodoEvent {
  final int id;

  DeleteItem(this.id);

  @override
  List<Object> get props => [id];
}

class ChangeItemStatus extends TodoEvent {
  final bool status;

  ChangeItemStatus(this.status);

  @override
  List<Object> get props => [status];
}

class AppStarted extends TodoEvent {}
