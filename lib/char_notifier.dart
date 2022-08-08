import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ricknmorty/char_model.dart';
import 'package:ricknmorty/char_repository.dart';

class CharNotifier extends StateNotifier<List<CharModel>> {
  CharNotifier() : super([]) {
    getAllChar();
  }

  CharRepository repository = CharRepository(dio: Dio());

  getAllChar() async {
    state = await repository.getAllCharacters();
  }
}
