import 'model.dart';

class TodoRepository {
  static int todoIndex = 0;
  final List<Todo> todos = [
    Todo(name: 'Complete training', completed: false),
    Todo(name: 'Continue studying', completed: true)
  ];

  completedTodos() {
    return todos.where((x) => x.completed).toList();
  }

  stillTodos() {
    return todos.where((x) => !x.completed).toList();
  }

  void addTodo(Todo todo) {
    todos.add(Todo(name: todo.name, completed: todo.completed));
  }

  void updateTodo(Todo todo, Todo newTodo) {
    var index = todos.indexOf(todo);
    todos[index] = newTodo;
  }
}
