import 'package:flutter_riverpod_clean_architecture/domain/repositories/todo_repository.dart';
import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';

class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase(this.repository);

  Future<void> call(Todo todo) async {
    return repository.addTodo(todo);
  }
}
