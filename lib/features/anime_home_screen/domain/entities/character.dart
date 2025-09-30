import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String _name;
  final String _series;
  final String _imagePath;

  const Character({
    required String name,
    required String series,
    required String imagePath,
  }) : _name = name,
       _series = series,
       _imagePath = imagePath;

  String get name => _name;
  String get series => _series;
  String get imagePath => _imagePath;

  @override
  List<Object?> get props => [_name, _series, _imagePath];
}
