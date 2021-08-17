import 'navigation.dart';

class NavigationEvent {
  Navigation navigation = Navigation.all;
}

class UpdateNavigationEvent extends NavigationEvent {
  UpdateNavigationEvent({required Navigation navigation}) {
    this.navigation = navigation;
  }
}