import '../todo/model.dart';

abstract class TodoFormEvent {}

class ShowAddTodoFormEvent extends TodoFormEvent {}

class AddTodoFormEvent extends TodoFormEvent {
  final Todo todo;

  AddTodoFormEvent({required this.todo});
}