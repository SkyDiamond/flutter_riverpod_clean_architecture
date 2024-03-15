import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod_clean_architecture/data/service/api/api_interceptor.dart';
import 'package:flutter_riverpod_clean_architecture/domain/use_cases/update_todo_use_case.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/state/todo_list_notifier.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/state/todo_list_state.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories_impl/todo_repository_impl.dart';
import 'domain/repositories/todo_repository.dart';
import 'domain/use_cases/get_todos_use_case.dart';
import 'domain/use_cases/add_todo_use_case.dart';

// Dio Client Provider
final dioProvider = Provider<Dio>((ref) {
  return Dio()
    ..interceptors.add(
      ApiInterceptor(),
    ); // Configure Dio instance (BaseOptions, Interceptors)
});

// Remote Data Source Provider
final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSource(ref.watch(dioProvider));
});

// Todo Repository Provider
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepositoryImpl(ref.watch(remoteDataSourceProvider));
});

// GetTodos Use Case Provider
final getTodosUseCaseProvider = Provider<GetTodosUseCase>((ref) {
  return GetTodosUseCase(ref.watch(todoRepositoryProvider));
});

// AddTodo Use Case Provider
final addTodoUseCaseProvider = Provider<AddTodoUseCase>((ref) {
  return AddTodoUseCase(ref.watch(todoRepositoryProvider));
});

// AddTodo Use Case Provider
final updateTodoUseCaseProvider = Provider<UpdateTodoUseCase>((ref) {
  return UpdateTodoUseCase(ref.watch(todoRepositoryProvider));
});

final todoListNotifierProvider = StateNotifierProvider<TodoListNotifier, TodoListState>((ref) {
  final getTodosUseCase = ref.watch(getTodosUseCaseProvider);
  final addTodoUseCase = ref.watch(addTodoUseCaseProvider);
  final updateTodoUseCase = ref.watch(updateTodoUseCaseProvider);

  return TodoListNotifier(getTodosUseCase, addTodoUseCase, updateTodoUseCase);
});
