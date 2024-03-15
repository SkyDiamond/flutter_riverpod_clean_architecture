import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';
import 'package:flutter_riverpod_clean_architecture/domain/repositories/todo_repository.dart';
import 'package:flutter_riverpod_clean_architecture/data/datasources/remote_data_source.dart';
import 'package:flutter_riverpod_clean_architecture/data/models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final RemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Todo>> fetchTodos() async {
    final todoModels = await remoteDataSource.fetchTodos();
    return todoModels.map((model) => Todo.fromModel(model)).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    await remoteDataSource.addTodo(todoModel);
  }

  @override
  Future<void> updateTodo(String id, bool completed) async {
    await remoteDataSource.updateTodo(id, completed);
  }
}
