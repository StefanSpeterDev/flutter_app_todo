import 'package:flutter/material.dart';
import 'todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {

  final controllerInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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

              controllerInput.clear();

              Navigator.of(context).pop(customTodo);

            },
            child: Text('Ajouter')),
      ],
    );;
  }
}
