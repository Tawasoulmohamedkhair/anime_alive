import '../entities/subscription_plan_entity.dart';

abstract class SubscriptionPlanRepository {
  Future<List<SubscriptionPlanEntity>> getPlans();
}
