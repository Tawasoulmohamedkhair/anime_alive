import '../../domain/entities/subscription_plan_entity.dart';

class SubscriptionPlanModel extends SubscriptionPlanEntity {
  const SubscriptionPlanModel({
    required super.id,
    required super.title,
    required super.price,
    required super.period,
    required super.features,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      period: json['period'],
      features: List<String>.from(json['features']),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "period": period,
    "features": features,
  };
}
