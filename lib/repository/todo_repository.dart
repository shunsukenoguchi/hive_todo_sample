import 'package:hive_todo_sample/boxes.dart';
import 'package:hive_todo_sample/model/todo/todo.dart';

class TodoRepository {
  Future addTodoRepository(String contents) async {
    final todo = Todo()..contents = contents;
    final box = Boxes.getTodos();
    box.add(todo);
  }

  void deleteTodoRepository(Todo todo) {
    todo.delete();
  }
}
