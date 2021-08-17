import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo/todo.dart';
import 'todo_form/todo_form.dart';
import 'navigation/navigation.dart';

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
            BlocProvider(
              create: (_) => TodoFormBloc(),
            ),
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
                    child: AlertDialog(
                      content: TodoForm(
                        todo: todo,
                      ),
                    ),
                  );
                });
          } else if (state is AddedTodoFormState) {
            context
                .read<TodoBloc>()
                .add(AddTodoEvent(todo: state.todo));
          }
        },
        child: Builder(builder: (context) {
          final todoState = context.watch<TodoBloc>().state;
          final navigationState = context.watch<NavigationBloc>().state;
          if (todoState is UninitializedTodoState) {
            return Center(child: CircularProgressIndicator());
          } else if (todoState is LoadedTodoState) {
            if (navigationState is CurrentNavigationState) {
              if (navigationState.navigation == Navigation.all) {
                return TodoList(
                  todos: todoState.todos,
                );
              } else if (navigationState.navigation == Navigation.done) {
                return TodoList(
                  todos: todoState.todos.where((t) => t.completed).toList(),
                );
              } else {
                return TodoList(
                  todos: todoState.todos.where((t) => !t.completed).toList(),
                );
              }
            }
          }
          return Text('Unhandled state');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<TodoFormBloc>().add(ShowAddTodoFormEvent()),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
        if (state is CurrentNavigationState) {
          return BottomNavigationBar(
            currentIndex: state.navigation.index,
            onTap: (value) => context
                .read<NavigationBloc>()
                .add(UpdateNavigationEvent(Navigation.values[value])),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.all_inbox), label: 'All'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mark_email_unread), label: 'Todo'),
              BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
            ],
          );
        }
        return SizedBox.shrink();
      }),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: todos
          .map<Widget>(
            (t) => Card(
              elevation: 10.0,
              child: Container(
                padding: const EdgeInsets.all(
                  14.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.name,
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Checkbox(
                        value: t.completed,
                        onChanged: (bool? value) {
                          if (value != null) {
                            context.read<TodoBloc>().add(UpdateTodoEvent(
                                toBeUpdated: t,
                                updatedTodo: t.copyWith(completed: value)));
                          }
                        }),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
