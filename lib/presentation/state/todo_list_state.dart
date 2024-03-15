// todo_list_state.dart
import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';

enum TodoListStatus { loading, loaded, error }

class TodoListState {
  final TodoListStatus status;
  final List<Todo> todos;
  final String? errorMessage;

  TodoListState({
    required this.status,
    this.todos = const [],
    this.errorMessage,
  });

  TodoListState copyWith({
    TodoListStatus? status,
    List<Todo>? todos,
    String? errorMessage,
  }) {
    return TodoListState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
