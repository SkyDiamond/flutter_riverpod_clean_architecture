import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_clean_architecture/domain/entities/todo.dart';
import 'package:flutter_riverpod_clean_architecture/providers.dart';

class TodoItemWidget extends ConsumerWidget {
  final Todo todo;

  const TodoItemWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? value) async {
          bool completed = value ?? false;
          
          await ref.read(todoListNotifierProvider.notifier).updateTodo(todo.id, completed);
        },
      ),
    );
  }
}
