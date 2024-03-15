import 'package:flutter_riverpod_clean_architecture/domain/repositories/todo_repository.dart';
import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';

class GetTodosUseCase {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  Future<List<Todo>> call() async {
    return repository.fetchTodos();
  }
}

