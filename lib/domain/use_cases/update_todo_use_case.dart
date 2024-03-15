import 'package:flutter_riverpod_clean_architecture/domain/repositories/todo_repository.dart';

class UpdateTodoUseCase {
  final TodoRepository repository;

  UpdateTodoUseCase(this.repository);

  Future<void> call(String id, bool completed) async {
    return repository.updateTodo(id, completed);
  }
}
