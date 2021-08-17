import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({required String name, required bool completed}) = _Todo;
}
