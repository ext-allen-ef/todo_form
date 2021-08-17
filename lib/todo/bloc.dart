import 'package:bloc/bloc.dart';
import 'package:sandbox/todo/repository.dart';
import 'event.dart';
import 'state.dart';
import 'repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc(this._todoRepository) : super(UninitializedTodoState());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is LoadEventsTodoEvent) {
      await Future.delayed(Duration(seconds: 1));
      yield LoadedTodoState(todos: _todoRepository.todos);
    } else if(event is AddTodoEvent) {
      _todoRepository.addTodo(event.todo);
      yield LoadedTodoState(todos: _todoRepository.todos);
    } else if(event is UpdateTodoEvent) {
      _todoRepository.updateTodo(event.toBeUpdated, event.updatedTodo);
      yield LoadedTodoState(todos: _todoRepository.todos);
    }
  }
}
