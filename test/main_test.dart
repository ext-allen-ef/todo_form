import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:sandbox/todo/todo.dart';
import 'package:sandbox/main.dart';
import 'package:sandbox/todo_form/event.dart';
import 'package:sandbox/todo_form/state.dart';
import 'package:sandbox/todo_form/todo_form.dart';
import 'package:sandbox/navigation/navigation.dart';

class MockTodoBloc extends MockBloc<TodoEvent, TodoState> implements TodoBloc {}

class MockTodoFormBloc extends MockBloc<TodoFormEvent, TodoFormState>
    implements TodoFormBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue<TodoState>(UninitializedTodoState());
    registerFallbackValue<TodoEvent>(LoadEventsTodoEvent());
    registerFallbackValue<TodoFormEvent>(ShowAddTodoFormEvent());
    registerFallbackValue<TodoFormState>(InitialTodoFormState());
  });
  testWidgets('will show spinner when loading', (WidgetTester tester) async {
    final todoBloc = MockTodoBloc();
    whenListen(todoBloc, Stream.fromIterable([LoadedTodoState(todos: [])]),
        initialState: UninitializedTodoState());
    final todoFormBloc = MockTodoFormBloc();
    whenListen(todoFormBloc, Stream.fromIterable([InitialTodoFormState()]),
        initialState: InitialTodoFormState());
    await tester.pumpWidget(MaterialApp(
        home: MultiBlocProvider(providers: [
      BlocProvider<TodoBloc>(create: (_) => todoBloc),
      BlocProvider<TodoFormBloc>(create: (_) => todoFormBloc),
      BlocProvider(create: (_) => NavigationBloc()),
    ], child: Home())));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
