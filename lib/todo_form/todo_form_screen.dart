import 'package:flutter/material.dart';
import 'todo_form_widget.dart';
import '../todo/model.dart';

class TodoFormScreen extends StatelessWidget {
  final Todo todo;

  TodoFormScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoForm(
        todo: todo,
      ),
    );
  }
}
