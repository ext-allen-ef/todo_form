import 'package:get_it/get_it.dart';

import 'dog/dog.dart';


final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => DogRepository());

  sl.registerFactory(() => DogBloc(sl()));
}