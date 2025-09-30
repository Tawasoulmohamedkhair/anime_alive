import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';

abstract class AnimesRepository {
  Future<AnimeDetailEntity> getAnimeDetails(String animeId);
}
