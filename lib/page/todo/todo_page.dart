import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_sample/boxes.dart';
import 'package:hive_todo_sample/model/todo/todo.dart';
import 'package:hive_todo_sample/page/todo/todo_model.dart';

class TodoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoModel = ref.read(todoModelProvider);
    var _contentsController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Todo Sample'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    controller: _contentsController,
                    decoration: InputDecoration(
                      hintText: 'Todoを追加してください',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            todoModel.addTodo(_contentsController.text),
                            _contentsController.text = ''
                          },
                      child: Text('追加')),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ValueListenableBuilder<Box<Todo>>(
              valueListenable: Boxes.getTodos().listenable(),
              builder: (context, box, _) {
                final todos = box.values.toList().cast<Todo>();
                return buildContent(todos, todoModel);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(List<Todo> todos, TodoModel todoModel) {
    if (todos.isEmpty) {
      return Center(
        child: Text(
          '',
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];
                  return buildTodo(context, todo, todoModel);
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget buildTodo(BuildContext context, Todo todo, TodoModel todoModel) {
    return Card(
        color: Colors.white,
        child: ExpansionTile(
          title: Text(
            todo.contents,
          ),
          trailing: buildButtons(context, todo, todoModel),
        ));
  }

  Widget buildButtons(BuildContext context, Todo todo, TodoModel todoModel) =>
      ElevatedButton(
          onPressed: () => {todoModel.deleteTodo(todo)}, child: Text('削除'));
}
