import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(String id, bool completed);
}
