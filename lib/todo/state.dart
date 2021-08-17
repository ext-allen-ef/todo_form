import 'model.dart';

abstract class TodoState {}

class UninitializedTodoState extends TodoState {}

class LoadedTodoState extends TodoState {
  final List<Todo> todos;
  LoadedTodoState({required this.todos});
}