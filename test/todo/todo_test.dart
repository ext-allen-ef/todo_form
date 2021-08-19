import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_test.mocks.dart';
import 'package:sandbox/todo/todo.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoRepository repo;
  late List<Todo> todos;
  blocTest('Can load initial data for bloc',
      build: () => TodoBloc(repo),
      setUp: () {
        repo = MockTodoRepository();
        todos = [Todo(name: 'hi', completed: false)];
        when(repo.todos).thenReturn(todos);
      },
      act: (TodoBloc b) => b.add(LoadEventsTodoEvent()),
      expect: () => [LoadedTodoState(todos: todos)]);
}
