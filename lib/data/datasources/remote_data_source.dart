import 'package:dio/dio.dart';
import 'package:flutter_riverpod_clean_architecture/data/models/todo_model.dart';
import 'package:flutter_riverpod_clean_architecture/data/service/api/todo_api.dart';

class RemoteDataSource {
  late final TodoApi _todoApi;

  RemoteDataSource(Dio dio) {
    _todoApi = TodoApi(dio);
  }

  Future<List<TodoModel>> fetchTodos() async {
    return _todoApi.getTodos();
  }

  Future<void> addTodo(TodoModel todoModel) async {
    await _todoApi.addTodo(todoModel);
  }

  Future<void> updateTodo(String id, bool completed) async {
    final body = {'completed': completed};
    await _todoApi.updateTodo(id: id, body: body);
  }
}
