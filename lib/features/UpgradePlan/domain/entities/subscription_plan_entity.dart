import 'package:equatable/equatable.dart';

class SubscriptionPlanEntity extends Equatable {
  final int _id;
  final String _title;
  final double _price;
  final String _period;
  final List<String> _features;

  const SubscriptionPlanEntity({
    required int id,
    required String title,
    required double price,
    required String period,
    required List<String> features,
  }) : _id = id,
       _title = title,
       _price = price,
       _period = period,
       _features = features;

  // Getters (no setters)
  int get id => _id;
  String get title => _title;
  double get price => _price;
  String get period => _period;
  List<String> get features => List.unmodifiable(_features);

  @override
  List<Object> get props => [_id, _title, _price, _period, _features];
}
