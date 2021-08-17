import 'package:sandbox/todo/model.dart';

abstract class TodoState {}

class UninitializedTodoState extends TodoState {}

class LoadedTodoState extends TodoState {
  final List<Todo> all;
  final List<Todo> todos;
  final List<Todo> completed;
  LoadedTodoState({required this.all, required this.todos, required this.completed});
}