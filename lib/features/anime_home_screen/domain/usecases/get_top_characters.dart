import 'package:anime_alive/features/anime_home_screen/domain/entities/character.dart';
import 'package:anime_alive/features/anime_home_screen/domain/repository/anime_repository.dart';


class GetTopCharacters {
  final AnimeRepository repository;

  GetTopCharacters(this.repository);

  Future<List<Character>> call() {
    return repository.getTopCharacters();
  }
}
