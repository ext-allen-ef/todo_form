import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/todo_form/bloc.dart';
import 'package:sandbox/todo_form/state.dart';

import 'todo/todo.dart';
import 'todo_form/todo_form.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoFormBloc = context.read<TodoFormBloc>();
    return ListView(
      children: todos
          .map<Widget>(
            (t) => Card(
          elevation: 10.0,
          child: Container(
            padding: const EdgeInsets.all(
              14.0,
            ),
            child: GestureDetector(
              onDoubleTap: () => todoFormBloc.add(EditTodoFormEvent(todo: t)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.name,
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                  Checkbox(
                      value: t.completed,
                      onChanged: (bool? value) {
                        if (value != null) {
                          context.read<TodoBloc>().add(UpdateTodoEvent(
                              toBeUpdated: t,
                              newTodo: t.copyWith(completed: value)));
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}