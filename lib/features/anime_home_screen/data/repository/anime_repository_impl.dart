import 'package:anime_alive/features/anime_home_screen/data/datasource/anime_mock_data_source.dart';
import 'package:anime_alive/features/anime_home_screen/data/models/character_model.dart';
import 'package:anime_alive/features/anime_home_screen/domain/entities/anime_series.dart';
import 'package:anime_alive/features/anime_home_screen/domain/entities/character.dart';
import 'package:anime_alive/features/anime_home_screen/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeMockDataSource dataSource;

  AnimeRepositoryImpl(this.dataSource);

  @override
  Future<List<AnimeSeries>> getAnimeSeries() async {
    final models = await dataSource.getAnimeSeries();
    return models;
  }

  @override
  Future<List<Character>> getTopCharacters() async {
    final List<CharacterModel> models = await dataSource.getTopCharacters();
    return models.map((m) => m.toEntity()).toList();
  }
}
