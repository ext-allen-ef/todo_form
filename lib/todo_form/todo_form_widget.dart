import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/todo/todo.dart';
import 'todo_form.dart';

class TodoFormWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Todo todo;

  TodoFormWidget({Key? key, required this.todo /*, required this.onSubmission*/
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoFormBloc, TodoFormState>(
      builder: (context, state) {
        var todoName = '';
        if (state is ShowEditTodoFormState) {
          todoName = state.todo.name;
        }
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                initialValue: todoName,
                decoration: InputDecoration(labelText: 'Todo'),
                onFieldSubmitted: (value) {
                  final valid = _formKey.currentState!.validate();
                  if (valid) {
                    _formKey.currentState?.save();
                  }
                },
                onSaved: (value) {
                  if (state is ShowAddTodoFormState) {
                    context.read<TodoFormBloc>().add(
                        AddTodoFormEvent(todo: todo.copyWith(name: value!)));
                  }
                  if (state is ShowEditTodoFormState) {
                    context.read<TodoFormBloc>().add(SaveTodoFormEvent(
                        todo: todo.copyWith(name: value!), toBeUpdated: todo));
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name!";
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () {
                final valid = _formKey.currentState!.validate();
                if (valid) {
                  _formKey.currentState?.save();
                }
              }, child: Builder(builder: (context) {
                if (state is ShowAddTodoFormState) {
                  return Text('Create');
                }
                return Text('Save');
              }))
            ],
          ),
        );
      },
    );
  }
}
