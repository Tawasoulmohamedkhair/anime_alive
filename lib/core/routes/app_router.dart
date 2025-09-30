import 'package:anime_alive/features/DetailsScreen/domain/entity/anime_detail_entity.dart';
import 'package:anime_alive/features/DetailsScreen/presentation/screens/details_screen.dart';
import 'package:anime_alive/features/UpgradePlan/data/datasources/subscription_plan_local_data_source.dart';
import 'package:anime_alive/features/UpgradePlan/data/repositories/subscription_plan_repository_impl.dart';
import 'package:anime_alive/features/UpgradePlan/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:anime_alive/features/UpgradePlan/presentation/screens/upgrade_plane.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String animeDetail = '/AnimeDetailScreen';
  static const String upgradeplan = '/UpgradePlane';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const AnimeHomeScreen());

      case animeDetail:
        final animeId = settings.arguments as String?;
        final details = settings.arguments as AnimeDetailEntity?;

        if (animeId == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text(
                  "Error: Anime ID missing for detail screen.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) => AnimeDetailScreen(details: details!),
        );

      case upgradeplan:
        final localDataSource = SubscriptionPlanLocalDataSourceImpl();
        final repository = SubscriptionPlanRepositoryImpl(localDataSource);
        final getPlansUseCase = GetSubscriptionPlansUseCase(repository);

        return MaterialPageRoute(
          builder: (_) => UpgradePlanScreen(getPlansUseCase: getPlansUseCase),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
