import 'package:sandbox/todo/todo.dart';

abstract class TodoFormEvent {}

class ShowAddTodoFormEvent extends TodoFormEvent {}

class AddTodoFormEvent extends TodoFormEvent {
  final Todo todo;

  AddTodoFormEvent({required this.todo});
}

class EditTodoFormEvent extends TodoFormEvent {
  final Todo todo;

  EditTodoFormEvent({required this.todo});
}

class SaveTodoFormEvent extends TodoFormEvent {
  final Todo todo;
  final Todo toBeUpdated;

  SaveTodoFormEvent({required this.todo, required this.toBeUpdated});
}
