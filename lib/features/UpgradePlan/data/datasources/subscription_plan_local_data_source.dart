import 'package:anime_alive/features/UpgradePlan/data/model/subscription_plan_model.dart';

abstract class SubscriptionPlanLocalDataSource {
  Future<List<SubscriptionPlanModel>> getPlans();
}

class SubscriptionPlanLocalDataSourceImpl
    implements SubscriptionPlanLocalDataSource {
  @override
  Future<List<SubscriptionPlanModel>> getPlans() async {
    await Future.delayed(const Duration(milliseconds: 500)); // simulate delay
    return [
      SubscriptionPlanModel(
        id: 1,
        title: "Monthly",
        price: 5.0,
        period: "month",
        features: ["Family Sharing", "HD Streaming"],
      ),
      SubscriptionPlanModel(
        id: 2,
        title: "Annually",
        price: 50.0,
        period: "year",
        features: ["Family Sharing", "HD Streaming", "Save 20%"],
      ),
    ];
  }
}
