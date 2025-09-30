import 'package:anime_alive/features/anime_home_screen/domain/repository/anime_repository.dart';

import '../entities/anime_series.dart';

class GetAnimeSeries {
  final AnimeRepository repository;

  GetAnimeSeries(this.repository);

  Future<List<AnimeSeries>> call() {
    return repository.getAnimeSeries();
  }
}
