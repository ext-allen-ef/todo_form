import 'model.dart';

abstract class TodoEvent {}

class LoadEventsTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent({required this.todo});
}

class UpdateTodoEvent extends TodoEvent {
  final Todo toBeUpdated;
  final Todo updatedTodo;

  UpdateTodoEvent({required this.toBeUpdated, required this.updatedTodo});
}