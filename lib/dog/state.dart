import 'model.dart';

abstract class DogState {}

class UninitializedDogState extends DogState {}

class DogLoadedDogState extends DogState {
  final Dog dog;

  DogLoadedDogState(this.dog);
}
