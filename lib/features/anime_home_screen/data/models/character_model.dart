import '../../domain/entities/character.dart';

class CharacterModel {
  final String name;
  final String series;
  final String imagePath;

  CharacterModel({
    required this.name,
    required this.series,
    required this.imagePath,
  });

  Character toEntity() {
    return Character(name: name, series: series, imagePath: imagePath);
  }
}
