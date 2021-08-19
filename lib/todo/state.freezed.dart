// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoadedTodoStateTearOff {
  const _$LoadedTodoStateTearOff();

  _LoadedTodoState call({required List<Todo> todos}) {
    return _LoadedTodoState(
      todos: todos,
    );
  }
}

/// @nodoc
const $LoadedTodoState = _$LoadedTodoStateTearOff();

/// @nodoc
mixin _$LoadedTodoState {
  List<Todo> get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadedTodoStateCopyWith<LoadedTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadedTodoStateCopyWith<$Res> {
  factory $LoadedTodoStateCopyWith(
          LoadedTodoState value, $Res Function(LoadedTodoState) then) =
      _$LoadedTodoStateCopyWithImpl<$Res>;
  $Res call({List<Todo> todos});
}

/// @nodoc
class _$LoadedTodoStateCopyWithImpl<$Res>
    implements $LoadedTodoStateCopyWith<$Res> {
  _$LoadedTodoStateCopyWithImpl(this._value, this._then);

  final LoadedTodoState _value;
  // ignore: unused_field
  final $Res Function(LoadedTodoState) _then;

  @override
  $Res call({
    Object? todos = freezed,
  }) {
    return _then(_value.copyWith(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
abstract class _$LoadedTodoStateCopyWith<$Res>
    implements $LoadedTodoStateCopyWith<$Res> {
  factory _$LoadedTodoStateCopyWith(
          _LoadedTodoState value, $Res Function(_LoadedTodoState) then) =
      __$LoadedTodoStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Todo> todos});
}

/// @nodoc
class __$LoadedTodoStateCopyWithImpl<$Res>
    extends _$LoadedTodoStateCopyWithImpl<$Res>
    implements _$LoadedTodoStateCopyWith<$Res> {
  __$LoadedTodoStateCopyWithImpl(
      _LoadedTodoState _value, $Res Function(_LoadedTodoState) _then)
      : super(_value, (v) => _then(v as _LoadedTodoState));

  @override
  _LoadedTodoState get _value => super._value as _LoadedTodoState;

  @override
  $Res call({
    Object? todos = freezed,
  }) {
    return _then(_LoadedTodoState(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_LoadedTodoState implements _LoadedTodoState {
  const _$_LoadedTodoState({required this.todos});

  @override
  final List<Todo> todos;

  @override
  String toString() {
    return 'LoadedTodoState(todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadedTodoState &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(todos);

  @JsonKey(ignore: true)
  @override
  _$LoadedTodoStateCopyWith<_LoadedTodoState> get copyWith =>
      __$LoadedTodoStateCopyWithImpl<_LoadedTodoState>(this, _$identity);
}

abstract class _LoadedTodoState implements LoadedTodoState {
  const factory _LoadedTodoState({required List<Todo> todos}) =
      _$_LoadedTodoState;

  @override
  List<Todo> get todos => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadedTodoStateCopyWith<_LoadedTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
