import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Todo extends Equatable {
  final String task;
  final bool isCompleted;
  final int id;

  Todo({
    @required this.task,
    @required this.id,
    this.isCompleted = false,
  });

  @override
  List<Object> get props => [task, isCompleted, id];

  @override
  String toString() {
    return 'Todo: $task, completed $isCompleted';
  }

  // JavaScript Object Notation
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'is_completed': isCompleted,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      task: json['task'],
      isCompleted: json['is_completed'] as bool,
    );
  }
}
