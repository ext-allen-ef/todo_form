import 'package:get_it/get_it.dart';
import 'todo/todo.dart';
import 'navigation/navigation.dart';
import 'todo_form/todo_form.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => TodoRepository());

  sl.registerFactory(() => NavigationBloc());
  sl.registerFactory(() => TodoBloc(sl()));
  sl.registerFactory(() => TodoFormBloc());
}