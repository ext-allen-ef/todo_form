import 'navigation.dart';

class NavigationState {
  final Navigation? navigation;
  final Type? navigationSource;

  NavigationState({this.navigation, this.navigationSource});
}

class CurrentNavigationState extends NavigationState {
  CurrentNavigationState({navigation, navigationSource}):
        super(navigation: navigation, navigationSource: navigationSource);

}

class CurrentNavigationFromPageState extends CurrentNavigationState {

}