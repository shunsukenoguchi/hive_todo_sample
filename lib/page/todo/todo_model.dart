import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_todo_sample/model/todo/todo.dart';
import 'package:hive_todo_sample/repository/todo_repository.dart';

final todoModelProvider = ChangeNotifierProvider<TodoModel>(
  (ref) => TodoModel(),
);

class TodoModel extends ChangeNotifier {
  TodoRepository todoRepository = TodoRepository();

  void addTodoRepository(String contents) {
    todoRepository.addTodo(contents);
  }

  void deleteTodoRepository(Todo todo) {
    todoRepository.deleteTodo(todo);
  }
}
