import 'package:flutter/material.dart';
import 'todo.dart';
import 'new_todo_dialog.dart';
import 'todo_list.dart';


class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // Item
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  // Add a todo to the list
  _addTodo() async {
    final customTodo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
         return NewTodoDialog();
        });
    if(customTodo != null){
      setState(() {
        todos.add(customTodo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TodoList(
        todos: todos,
        onTodoToggle: _toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(
          Icons.add,
          semanticLabel: 'Ajouter un item',
        ),
      ),
    );
  }
}
