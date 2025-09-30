import 'package:anime_alive/features/DetailsScreen/data/datasource/anime_remote_data_source.dart';
import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';
import 'package:anime_alive/features/DetailsScreen/domain/repository/anime_repository.dart';
import 'package:flutter/material.dart';

class AnimeRepositoryImpl implements AnimesRepository {
  final AnimeRemoteDataSource remoteDataSource;

  AnimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<AnimeDetailEntity> getAnimeDetails(String animeId) async {
    try {
      final json = await remoteDataSource.fetchAnimeDetails(animeId);

      return AnimeDetailEntity(
        title: json['title'] as String,
        genres: List<String>.from(json['genres'] as List),

        description: json['description'] as String,
        backdropPath: json['backdrop'] as String,
        posterPath: json['poster'] as String,
      );
    } catch (e) {
      debugPrint('Repository Error fetching details: $e');
      rethrow;
    }
  }
}
