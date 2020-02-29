import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Todo extends Equatable {
  final String task;
  final bool isCompleted;

  Todo({
    @required this.task,
    this.isCompleted = false,
  });

  @override
  List<Object> get props => [task, isCompleted];

  @override
  String toString() {
    return 'Todo: $task, completed $isCompleted';
  }
}
