import 'package:equatable/equatable.dart';

class AnimeDetailEntity extends Equatable {
  final String _title;
  final List<String> _genres;
  final String _description;
  final String _backdropPath;
  final String _posterPath;

  const AnimeDetailEntity({
    required String title,
    required List<String> genres,
    required String description,
    required String backdropPath,
    required String posterPath,
  }) : _title = title,
       _genres = genres,
       _description = description,
       _backdropPath = backdropPath,
       _posterPath = posterPath;

  String get title => _title;
  List<String> get genres => List.unmodifiable(_genres);
  String get description => _description;
  String get backdropPath => _backdropPath;
  String get posterPath => _posterPath;
  @override
  List<Object?> get props => [
    _title,
    _genres,
    _description,
    _backdropPath,
    _posterPath,
  ];
}
