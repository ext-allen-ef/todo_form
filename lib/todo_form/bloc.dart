import 'package:bloc/bloc.dart';
import 'event.dart';
import 'state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc() : super(InitialTodoFormState());

  @override
  Stream<TodoFormState> mapEventToState(TodoFormEvent event) async* {
    if(event is ShowAddTodoFormEvent) {
      yield ShowAddTodoFormState();
    } else if(event is AddTodoFormEvent) {
      yield AddedTodoFormState(event.todo);
    }
  }

}