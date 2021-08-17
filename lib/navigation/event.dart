import 'model.dart';

abstract class NavigationEvent {}

class UpdateNavigationEvent extends NavigationEvent {
  final Navigation navigation;

  UpdateNavigationEvent(this.navigation);
}
