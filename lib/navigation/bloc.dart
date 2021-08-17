import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(navigation: Navigation.all));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is UpdateNavigationEvent) {
      yield CurrentNavigationState(navigation: event.navigation, navigationSource: UpdateNavigationEvent);
    }
  }

}