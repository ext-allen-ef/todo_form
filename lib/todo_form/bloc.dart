import 'todo_form.dart';
import 'package:bloc/bloc.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc() : super(UninitializedFormState());

  @override
  Stream<TodoFormState> mapEventToState(event) async* {
    if(event is ShowAddTodoFormEvent) {
      yield ShowAddTodoFormState();
    }
    if(event is EditTodoFormEvent) {
      yield ShowEditTodoFormState(todo: event.todo);
    }
    else if (event is AddTodoFormEvent) {
      yield AddedTodoFormState(todo: event.todo);
    }
    if(event is SaveTodoFormEvent) {
      yield SavedTodoFormState(todo: event.todo, toBeUpdated: event.toBeUpdated);
    }
  }
}
