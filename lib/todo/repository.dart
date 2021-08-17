import 'model.dart';

class TodoRepository {
  final List<Todo> todos = [
    Todo(name: 'Complete training', completed: true),
    Todo(name: 'Continue studying', completed: false),
  ];

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void updateTodo(Todo toBeUpdated, Todo updatedTodo) {
    final i = todos.indexOf(toBeUpdated);
    todos.removeAt(i);
    todos.insert(i, updatedTodo);
  }
}