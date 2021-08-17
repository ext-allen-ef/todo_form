
import 'package:sandbox/todo/todo.dart';

class TodoFormInput {
  String name;

  TodoFormInput({required this.name});
}

abstract class TodoFormState {}

class UninitializedFormState extends TodoFormState {}

class AddFormState extends TodoFormState {
  TodoFormInput todo = TodoFormInput(name: '');

  AddFormState({required this.todo});
}

class ShowAddTodoFormState extends TodoFormState {
}

class ShowEditTodoFormState extends TodoFormState {
  final Todo todo;

  ShowEditTodoFormState({required this.todo});
}

class AddedTodoFormState extends TodoFormState {
  final Todo todo;
  AddedTodoFormState({required this.todo});
}

class SavedTodoFormState extends TodoFormState {
  final Todo todo;
  final Todo toBeUpdated;
  SavedTodoFormState({required this.todo, required this.toBeUpdated});
}

