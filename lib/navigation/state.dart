import 'package:freezed_annotation/freezed_annotation.dart';
import 'model.dart';

part 'state.freezed.dart';

abstract class NavigationState {}

@freezed
class CurrentNavigationState extends NavigationState
    with _$CurrentNavigationState {
  const factory CurrentNavigationState({required Navigation navigation}) =
      _CurrentNavigationState;
}
