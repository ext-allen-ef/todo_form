import '../todo/model.dart';

abstract class TodoFormState {}

class InitialTodoFormState extends TodoFormState {}

class ShowAddTodoFormState extends TodoFormState {}

class AddedTodoFormState extends TodoFormState {
  final Todo todo;

  AddedTodoFormState(this.todo);
}
