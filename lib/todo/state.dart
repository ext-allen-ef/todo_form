import 'package:freezed_annotation/freezed_annotation.dart';
import 'model.dart';

part 'state.freezed.dart';

abstract class TodoState {}

class UninitializedTodoState extends TodoState {}

@freezed
class LoadedTodoState extends TodoState with _$LoadedTodoState {
  const factory LoadedTodoState({required List<Todo> todos}) = _LoadedTodoState;
}