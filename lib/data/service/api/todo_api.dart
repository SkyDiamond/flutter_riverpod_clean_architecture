import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod_clean_architecture/data/models/todo_model.dart';

part 'todo_api.g.dart';

@RestApi(baseUrl: "https://65f32397105614e6549ff169.mockapi.io")
abstract class TodoApi {
  factory TodoApi(Dio dio, {String baseUrl}) = _TodoApi;

  @GET("/todos")
  Future<List<TodoModel>> getTodos();

  @POST("/todos")
  Future<void> addTodo(@Body() TodoModel todo);

  @PUT("/todos/{id}")
  Future<TodoModel> updateTodo({
    @Path("id") required String id,
    @Body() required Map<String, bool> body,
  });
}
