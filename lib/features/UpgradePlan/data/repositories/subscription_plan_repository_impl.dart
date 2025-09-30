import '../../domain/entities/subscription_plan_entity.dart';
import '../../domain/repositories/subscription_plan_repository.dart';
import '../datasources/subscription_plan_local_data_source.dart';

class SubscriptionPlanRepositoryImpl implements SubscriptionPlanRepository {
  final SubscriptionPlanLocalDataSource localDataSource;

  SubscriptionPlanRepositoryImpl(this.localDataSource);

  @override
  Future<List<SubscriptionPlanEntity>> getPlans() async {
    return await localDataSource.getPlans();
  }
}
