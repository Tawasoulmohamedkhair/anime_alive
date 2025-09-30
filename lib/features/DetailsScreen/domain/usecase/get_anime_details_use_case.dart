import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/assets_string.dart';
import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';

class GetAnimeDetailsUseCase {
  Future<AnimeDetailEntity> call(String animeId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const AnimeDetailEntity(
      title: 'Mock Anime Details',
      description: AppString.demonSlayer,
      backdropPath: AssetsString.demons,
      posterPath: AssetsString.demon,
      genres: [AppString.darkFantasy, AppString.action, AppString.adventure],
    );
  }
}
