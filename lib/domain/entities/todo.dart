import 'package:flutter_riverpod_clean_architecture/data/models/todo_model.dart';

class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});

  factory Todo.fromModel(TodoModel model) {
    return Todo(
      id: model.id,
      title: model.title,
      completed: model.completed,
    );
  }
}
