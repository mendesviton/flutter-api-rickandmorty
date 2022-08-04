import 'package:dio/dio.dart';
import 'package:ricknmorty/char_model.dart';

class CharRepository {
  final Dio dio;

  CharRepository({
    required this.dio,
  });

  List<CharModel> characters = [];

  Future<List<CharModel>> getAllCharacters() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');

    characters = List.from(response.data['results'].map((char) {
      return CharModel.fromMap(char);
    }));

    characters.removeAt(18);
    print(characters);

    return characters;
  }
}
