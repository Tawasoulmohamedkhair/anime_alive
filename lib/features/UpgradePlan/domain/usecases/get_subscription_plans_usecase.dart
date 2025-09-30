import '../entities/subscription_plan_entity.dart';
import '../repositories/subscription_plan_repository.dart';

class GetSubscriptionPlansUseCase {
  final SubscriptionPlanRepository repository;

  GetSubscriptionPlansUseCase(this.repository);

  Future<List<SubscriptionPlanEntity>> call() async {
    return await repository.getPlans();
  }
}
