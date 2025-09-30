import 'package:anime_alive/features/anime_home_screen/domain/entities/anime_series.dart';

class AnimeSeriesModel extends AnimeSeries {
  const AnimeSeriesModel({
    required super.name,
    required super.type,
    required super.image,
  });

  factory AnimeSeriesModel.fromJson(Map<String, dynamic> json) {
    return AnimeSeriesModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'type': type, 'image': image};
  }
}
