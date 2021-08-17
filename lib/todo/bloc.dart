import 'package:bloc/bloc.dart';
import 'package:sandbox/todo/model.dart';
import 'package:sandbox/todo/repository.dart';

import 'event.dart';
import 'state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;

  TodoBloc(this._todoRepository) : super(UninitializedTodoState());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {

    if (event is LoadEventsTodoEvent) {
      await Future.delayed(Duration(seconds: 3));
      yield LoadedTodoState(
          all: _todoRepository.todos,
          todos: _todoRepository.stillTodos(),
          completed: _todoRepository.completedTodos());
    }

    if (event is AddTodoEvent) {
      _todoRepository.addTodo(event.todo);
      yield LoadedTodoState(
          all: _todoRepository.todos,
          todos: _todoRepository.stillTodos(),
          completed: _todoRepository.completedTodos());
    }

    if (event is UpdateTodoEvent) {
      _todoRepository.updateTodo(event.toBeUpdated,
      event.newTodo);
      yield LoadedTodoState(
          all: _todoRepository.todos,
          todos: _todoRepository.stillTodos(),
          completed: _todoRepository.completedTodos());
    }
  }
}
