import 'package:hive/hive.dart';
import 'package:hive_todo_sample/model/todo/todo.dart';

class Boxes {
  static Box<Todo> getTodos() => Hive.box<Todo>('todos');
}
