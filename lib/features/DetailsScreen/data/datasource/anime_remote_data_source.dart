import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/core/constants/assets_string.dart';

class AnimeRemoteDataSource {
  Future<Map<String, dynamic>> fetchAnimeDetails(String animeId) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return {
      'id': animeId,
      'title': 'Demon Slayer',
      'genres': [AppString.darkFantasy, AppString.action, AppString.adventure],
      'views': AppString.views,
      'claps': AppString.clap,
      'seasons': AppString.season,
      'description': AppString.demonSlayer,
      'backdrop': AssetsString.demons,
      'poster': AssetsString.demon,
    };
  }
}
