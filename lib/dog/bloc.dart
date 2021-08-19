import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';
import 'repository.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository _dogRepository;

  DogBloc(this._dogRepository) : super(UninitializedDogState());

  @override
  Stream<DogState> mapEventToState(DogEvent event) async* {
    if (event is LoadDogEvent) {
      final dog = await _dogRepository.getRandomDog();
      yield DogLoadedDogState(dog);
    }
  }
}
