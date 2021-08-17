import 'model.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent({required this.todo});
}

class UpdateTodoEvent extends TodoEvent {
  final Todo toBeUpdated;
  final Todo newTodo;

  UpdateTodoEvent({required this.toBeUpdated, required this.newTodo});
}

class LoadEventsTodoEvent extends TodoEvent {
  // final List<Todo> todos;
  //
  // LoadEventsTodoEvent ({required this.todos});
}
