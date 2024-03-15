import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/state/todo_list_state.dart';
import 'package:flutter_riverpod_clean_architecture/presentation/widgets/todo_item_widget.dart';
import 'package:flutter_riverpod_clean_architecture/providers.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListState = ref.watch(todoListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: _buildBody(todoListState),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // final addTodo = ref.read(addTodoUseCaseProvider);
      //     // addTodo.call(Todo(title: 'New Todo', completed: false));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

Widget _buildBody(TodoListState state) {
  if (state.status == TodoListStatus.error) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Center(child: Text('Error: ${state.errorMessage}')),
    );
  }

  // No need to explicitly handle the loading state here
  return ListView.builder(
    itemCount: state.todos.length,
    itemBuilder: (context, index) {
      return TodoItemWidget(todo: state.todos[index]);
    },
  );
}
