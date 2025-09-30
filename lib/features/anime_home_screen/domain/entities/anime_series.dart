import 'package:equatable/equatable.dart';

class AnimeSeries extends Equatable {
  final String _name;
  final String _type;
  final String _image;

  const AnimeSeries({
    required String name,
    required String type,
    required String image,
  }) : _name = name,
       _type = type,
       _image = image;

  // Getters
  String get name => _name;
  String get type => _type;
  String get image => _image;

  @override
  List<Object?> get props => [_name, _type, _image];
}
