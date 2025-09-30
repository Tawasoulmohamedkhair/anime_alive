import 'package:anime_alive/features/anime_home_screen/domain/entities/character.dart';

import '../../domain/entities/anime_series.dart';

abstract class AnimeRepository {
  Future<List<AnimeSeries>> getAnimeSeries();
  Future<List<Character>> getTopCharacters();
}
