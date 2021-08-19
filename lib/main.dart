import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dog/dog.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<DogBloc>(
        child: HomeScreen(),
        create: (_) => di.sl()..add(LoadDogEvent()),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          if (state is DogLoadedDogState) {
            return Center(
              child: Image.network(state.dog.message),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
