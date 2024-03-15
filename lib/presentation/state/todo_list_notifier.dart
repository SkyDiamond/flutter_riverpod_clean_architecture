import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';
import 'package:flutter_riverpod_clean_architecture/domain/use_cases/add_todo_use_case.dart';
import 'package:flutter_riverpod_clean_architecture/domain/use_cases/get_todos_use_case.dart';
import 'package:flutter_riverpod_clean_architecture/domain/use_cases/update_todo_use_case.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/state/todo_list_state.dart';

class TodoListNotifier extends StateNotifier<TodoListState> {
  final GetTodosUseCase _getTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;

  TodoListNotifier(
    this._getTodosUseCase,
    this._addTodoUseCase,
    this._updateTodoUseCase,
  ) : super(TodoListState(status: TodoListStatus.loading)) {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    // state = state.copyWith(status: TodoListStatus.loading);
    if (!EasyLoading.isShow) {
      EasyLoading.show();
    }

    try {
      final todos = await _getTodosUseCase.call();
      state = state.copyWith(status: TodoListStatus.loaded, todos: todos);
      EasyLoading.dismiss();
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.error,
        errorMessage: e.toString(),
      );
      EasyLoading.showError('Failed to load todos'); // Show error
    }
  }

  Future<void> addTodo(Todo todo) async {
    // state = state.copyWith(status: TodoListStatus.loading);
    EasyLoading.show();
    try {
      await _addTodoUseCase.call(todo);
      await _loadTodos(); // Reload the todo list after adding a new todo
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.error,
        errorMessage: e.toString(),
      );
      EasyLoading.showError('Failed to add todo'); // Show error
    }
  }

  Future<void> updateTodo(String id, bool completed) async {
    // state = state.copyWith(status: TodoListStatus.loading);
    EasyLoading.show();
    try {
      await _updateTodoUseCase.call(id, completed);
      await _loadTodos(); // Reload the todo list and update the state
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.error,
        errorMessage: e.toString(),
      );
      EasyLoading.showError('Failed to update todo'); // Show error
    }
  }
}
