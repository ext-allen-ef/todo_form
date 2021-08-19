import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class DogRepository {
  Future<Dog> getRandomDog() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    final json = jsonDecode(response.body);
    return Dog.fromJson(json);
  }
}
