import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/todo_form/bloc.dart';
import '../todo/todo.dart';
import '../todo_form/todo_form.dart';

class TodoForm extends StatelessWidget {
  TodoForm({Key? key, required this.todo}) : super(key: key);

  final Todo todo;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoFormBloc, TodoFormState>(
      listener: (BuildContext context, TodoFormState state) {
        if(state is AddedTodoFormState) {
          Navigator.of(context).pop();
        }
      },
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Todo'),
                onSaved: (value) => context
                    .read<TodoFormBloc>()
                    .add(AddTodoFormEvent(todo: todo.copyWith(name: value!))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: Text('Create'),
              ),
            ],
          )),
    );
  }
}
