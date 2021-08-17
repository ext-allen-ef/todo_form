import 'model.dart';

abstract class NavigationState {}

class CurrentNavigationState extends NavigationState {
  final Navigation navigation;

  CurrentNavigationState(this.navigation);
}
