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
class _$CurrentNavigationStateTearOff {
  const _$CurrentNavigationStateTearOff();

  _CurrentNavigationState call({required Navigation navigation}) {
    return _CurrentNavigationState(
      navigation: navigation,
    );
  }
}

/// @nodoc
const $CurrentNavigationState = _$CurrentNavigationStateTearOff();

/// @nodoc
mixin _$CurrentNavigationState {
  Navigation get navigation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentNavigationStateCopyWith<CurrentNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentNavigationStateCopyWith<$Res> {
  factory $CurrentNavigationStateCopyWith(CurrentNavigationState value,
          $Res Function(CurrentNavigationState) then) =
      _$CurrentNavigationStateCopyWithImpl<$Res>;
  $Res call({Navigation navigation});
}

/// @nodoc
class _$CurrentNavigationStateCopyWithImpl<$Res>
    implements $CurrentNavigationStateCopyWith<$Res> {
  _$CurrentNavigationStateCopyWithImpl(this._value, this._then);

  final CurrentNavigationState _value;
  // ignore: unused_field
  final $Res Function(CurrentNavigationState) _then;

  @override
  $Res call({
    Object? navigation = freezed,
  }) {
    return _then(_value.copyWith(
      navigation: navigation == freezed
          ? _value.navigation
          : navigation // ignore: cast_nullable_to_non_nullable
              as Navigation,
    ));
  }
}

/// @nodoc
abstract class _$CurrentNavigationStateCopyWith<$Res>
    implements $CurrentNavigationStateCopyWith<$Res> {
  factory _$CurrentNavigationStateCopyWith(_CurrentNavigationState value,
          $Res Function(_CurrentNavigationState) then) =
      __$CurrentNavigationStateCopyWithImpl<$Res>;
  @override
  $Res call({Navigation navigation});
}

/// @nodoc
class __$CurrentNavigationStateCopyWithImpl<$Res>
    extends _$CurrentNavigationStateCopyWithImpl<$Res>
    implements _$CurrentNavigationStateCopyWith<$Res> {
  __$CurrentNavigationStateCopyWithImpl(_CurrentNavigationState _value,
      $Res Function(_CurrentNavigationState) _then)
      : super(_value, (v) => _then(v as _CurrentNavigationState));

  @override
  _CurrentNavigationState get _value => super._value as _CurrentNavigationState;

  @override
  $Res call({
    Object? navigation = freezed,
  }) {
    return _then(_CurrentNavigationState(
      navigation: navigation == freezed
          ? _value.navigation
          : navigation // ignore: cast_nullable_to_non_nullable
              as Navigation,
    ));
  }
}

/// @nodoc

class _$_CurrentNavigationState implements _CurrentNavigationState {
  const _$_CurrentNavigationState({required this.navigation});

  @override
  final Navigation navigation;

  @override
  String toString() {
    return 'CurrentNavigationState(navigation: $navigation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CurrentNavigationState &&
            (identical(other.navigation, navigation) ||
                const DeepCollectionEquality()
                    .equals(other.navigation, navigation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(navigation);

  @JsonKey(ignore: true)
  @override
  _$CurrentNavigationStateCopyWith<_CurrentNavigationState> get copyWith =>
      __$CurrentNavigationStateCopyWithImpl<_CurrentNavigationState>(
          this, _$identity);
}

abstract class _CurrentNavigationState implements CurrentNavigationState {
  const factory _CurrentNavigationState({required Navigation navigation}) =
      _$_CurrentNavigationState;

  @override
  Navigation get navigation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CurrentNavigationStateCopyWith<_CurrentNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
