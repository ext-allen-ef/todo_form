import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:sandbox/navigation/navigation.dart';

void main() {
  blocTest('Updating navigation will output proper state',
      build: () => NavigationBloc(),
      skip: 0,
      act: (NavigationBloc b) => b.add(UpdateNavigationEvent(Navigation.todo)),
      expect: () => [CurrentNavigationState(navigation: Navigation.todo)]);

  test('initial bloc state will be all tab', () {
    final b = NavigationBloc();
    assert(b.state == CurrentNavigationState(navigation: Navigation.all));
    b.close();
  });
}
