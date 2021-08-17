import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/todo/repository.dart';
import 'package:sandbox/todo_list.dart';
import 'todo/todo.dart';
import 'navigation/navigation.dart';
import 'todo_form/todo_form.dart';

void main() {
  runApp(MyBusinessApp());
}

class MyBusinessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => TodoRepository(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => NavigationBloc()),
            BlocProvider(create: (_) => TodoFormBloc()),
            BlocProvider(
              create: (BuildContext context) =>
                  TodoBloc(context.read<TodoRepository>())
                    ..add(LoadEventsTodoEvent()),
            )
          ],
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: BlocListener<TodoFormBloc, TodoFormState>(
        listener: (BuildContext context, TodoFormState state) {
          if (state is ShowAddTodoFormState) {
            final todo = Todo(completed: false, name: '');
            final bloc = context.read<TodoFormBloc>();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BlocProvider.value(
                      value: bloc,
                      child: AlertDialog(content: TodoFormWidget(todo: todo)));
                });
          }
          if(state is ShowEditTodoFormState) {
            final todo = state.todo;
            final bloc = context.read<TodoFormBloc>();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BlocProvider.value(
                      value: bloc,
                      child: AlertDialog(content: TodoFormWidget(todo: todo)));
                });
          }
          if (state is AddedTodoFormState) {
            context.read<TodoBloc>().add(AddTodoEvent(todo: state.todo));
          }

          if(state is SavedTodoFormState) {
            context.read<TodoBloc>().add(UpdateTodoEvent(newTodo: state.todo, toBeUpdated: state.toBeUpdated));
          }
          if (state is AddedTodoFormState || state is SavedTodoFormState) {
            Navigator.of(context).pop();
          }
        },
        child: Builder(builder: (context) {
          final state = context.watch<TodoBloc>().state;
          final navigation = context.watch<NavigationBloc>().state;

          if (state is UninitializedTodoState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedTodoState) {
            if (navigation is CurrentNavigationState) {
              var todos = state.all;
              switch (navigation.navigation) {
                case Navigation.todo:
                  todos = state.todos;
                  break;
                case Navigation.done:
                  todos = state.completed;
                  break;
                default:
                  todos = state.all;
                  break;
              }
              return TodoList(todos: todos);
            }
            return TodoList(
              todos: state.all,
            );
          }
          return Text('Unhandled state');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read<TodoFormBloc>().add(ShowAddTodoFormEvent());
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.navigation!.index, //state.navigation.index,
          onTap: (value) => context
              .read<NavigationBloc>()
              .add(UpdateNavigationEvent(navigation: Navigation.values[value])),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.all_inbox), label: 'All'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mark_email_unread), label: 'Todo'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
          ],
        );
      }),
    );
  }
}
