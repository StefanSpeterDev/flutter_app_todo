import 'package:flutter/material.dart';
import 'todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // Item
  List<Todo> todos = [];

  // Pour contrôler la valeur de l'input du textfield et pouvoir l'ajouter à la liste
  TextEditingController controllerInput = new TextEditingController();

  // Check if a todo item is checked
  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  // Create an item in the list
  Widget _buildItem(BuildContext context, int index) {
    // Allow us to know which todo in the list is selected
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }

  // Add a todo to the list
  _addTodo() async {
    final customTodo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ajouter une note '),
            // Ajouter un texte input :
            content: TextField(
              controller: controllerInput,
              autofocus: true,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    // Retour en arrière
                    Navigator.of(context).pop();
                  },
                  child: Text('Annuler')),
              FlatButton(
                  onPressed: () {
                    final customTodo =
                        new Todo(title: controllerInput.value.text);
                    todos.add(customTodo);
                    // Vide la zone de l'input

                    // Renvoie vers la page de la liste
                    Navigator.of(context).pop(customTodo);
                  },
                  child: Text('Ajouter')),
            ],
          );
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
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
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
