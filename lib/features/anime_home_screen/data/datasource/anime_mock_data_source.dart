import 'package:anime_alive/features/anime_home_screen/data/models/anime_series_model.dart';

import '../models/character_model.dart';

class AnimeMockDataSource {
  Future<List<AnimeSeriesModel>> getAnimeSeries() async => [
    AnimeSeriesModel(
      name: "Detective Conan",
      type: "Mystery",
      image: "assets/images/card.png",
    ),
    AnimeSeriesModel(
      name: "Hunter x Hunter",
      type: "Adventure",
      image: "assets/images/hunter.png",
    ),
    AnimeSeriesModel(
      name: "Death Note",
      type: "Mystery",
      image: "assets/images/card1.png",
    ),
  ];

  Future<List<CharacterModel>> getTopCharacters() async => [
    CharacterModel(
      name: "Gon Freecss",
      series: "Hunter x Hunter",
      imagePath: "assets/images/Ellipse.png",
    ),
    CharacterModel(
      name: "Naruto Uzumaki",
      series: "Naruto",
      imagePath: "assets/images/Ellipse2.png",
    ),
    CharacterModel(
      name: "Luffy",
      series: "One Piece",
      imagePath: "assets/images/Ellipse3.png",
    ),
    CharacterModel(
      name: "Conan Edogawa",
      series: "Detective Conan",
      imagePath: "assets/images/conan.png",
    ),
  ];
}
